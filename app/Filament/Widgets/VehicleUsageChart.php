<?php

namespace App\Filament\Widgets;

use App\Models\Booking;
use Filament\Support\RawJs;
use Filament\Widgets\ChartWidget;
use Illuminate\Support\Carbon;

class VehicleUsageChart extends ChartWidget
{
    protected string $color = 'primary';

    protected ?string $heading = 'Grafik Pemakaian Kendaraan';

    protected ?string $description = 'Jumlah pemesanan kendaraan per bulan';

    protected ?string $maxHeight = '350px';

    protected static ?int $sort = 1;

    /**
     * @return array<scalar, scalar>|null
     */
    protected function getFilters(): ?array
    {
        return [
            'this_year' => 'Tahun Ini',
            'last_year' => 'Tahun Lalu',
            'last_6_months' => '6 Bulan Terakhir',
        ];
    }

    /**
     * @return array<string, mixed>
     */
    protected function getData(): array
    {
        $filter = $this->filter ?? 'this_year';

        $query = Booking::query();

        $user = auth()->user();
        if ($user && $user->role === \App\Enums\UserRole::Approver) {
            $query->where(function ($q) use ($user) {
                $q->where('approved_l1_id', $user->id)
                  ->orWhere('approved_l2_id', $user->id);
            });
        }

        match ($filter) {
            'last_year' => $query->whereYear('created_at', Carbon::now()->subYear()->year),
            'last_6_months' => $query->where('created_at', '>=', Carbon::now()->subMonths(6)),
            default => $query->whereYear('created_at', Carbon::now()->year),
        };

        $bookingsPerMonth = $query
            ->selectRaw('MONTH(created_at) as month, COUNT(*) as total')
            ->groupByRaw('MONTH(created_at)')
            ->orderByRaw('MONTH(created_at)')
            ->pluck('total', 'month');

        $months = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];

        $data = [];
        for ($i = 1; $i <= 12; $i++) {
            $data[] = (int) $bookingsPerMonth->get($i, 0);
        }

        return [
            'datasets' => [
                [
                    'label' => 'Jumlah Pemesanan',
                    'data' => $data,
                    'backgroundColor' => 'rgba(59, 130, 246, 0.6)',
                    'borderColor' => 'rgba(59, 130, 246, 1)',
                    'borderWidth' => 2,
                    'borderRadius' => 6,
                ],
            ],
            'labels' => $months,
        ];
    }

    /**
     * @return array<string, mixed>|RawJs|null
     */
    protected function getOptions(): array|RawJs|null
    {
        return [
            'scales' => [
                'y' => [
                    'beginAtZero' => true,
                    'ticks' => [
                        'stepSize' => 1,
                    ],
                ],
            ],
            'plugins' => [
                'legend' => [
                    'display' => true,
                    'position' => 'bottom',
                ],
            ],
        ];
    }

    protected function getType(): string
    {
        return 'bar';
    }
}

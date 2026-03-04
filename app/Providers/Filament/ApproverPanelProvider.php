<?php

namespace App\Providers\Filament;

use Caresome\FilamentNeobrutalism\NeobrutalismeTheme;
use Filament\Http\Middleware\Authenticate;
use Filament\Http\Middleware\AuthenticateSession;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Pages\Dashboard;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Filament\Widgets\AccountWidget;
use Filament\Widgets\FilamentInfoWidget;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\View\Middleware\ShareErrorsFromSession;

class ApproverPanelProvider extends PanelProvider
{
  public function panel(Panel $panel): Panel
  {
    return $panel
      ->id('approver')
      ->path('approver')
      ->brandName('Vehicle Management System')
      ->plugin(NeobrutalismeTheme::make())
      ->colors([
        'primary' => Color::Blue,
      ])
      ->discoverResources(in: app_path('Filament/Approver/Resources'), for: 'App\Filament\Approver\Resources')
      ->discoverPages(in: app_path('Filament/Approver/Pages'), for: 'App\Filament\Approver\Pages')
      ->pages([
        Dashboard::class,
      ])
      ->discoverWidgets(in: app_path('Filament/Approver/Widgets'), for: 'App\Filament\Approver\Widgets')
      ->widgets([
        \App\Filament\Widgets\VehicleUsageChart::class,
      ])
      ->middleware([
        EncryptCookies::class,
        AddQueuedCookiesToResponse::class,
        StartSession::class,
        AuthenticateSession::class,
        ShareErrorsFromSession::class,
        VerifyCsrfToken::class,
        SubstituteBindings::class,
        DisableBladeIconComponents::class,
        DispatchServingFilamentEvent::class,
      ])
      ->authMiddleware([
        Authenticate::class,
      ]);
  }
}

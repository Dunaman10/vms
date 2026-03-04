<?php

namespace App\Http\Responses;

use App\Enums\UserRole;
use Filament\Auth\Http\Responses\Contracts\LoginResponse as LoginResponseContract;
use Illuminate\Http\RedirectResponse;
use Livewire\Features\SupportRedirects\Redirector;

class LoginResponse implements LoginResponseContract
{
    /**
     * @param  \Illuminate\Http\Request  $request
     */
    public function toResponse($request): RedirectResponse|Redirector
    {
        $user = auth()->user();

        if ($user->role === UserRole::Admin) {
            return redirect()->to('/admin');
        }

        if ($user->role === UserRole::Approver) {
            return redirect()->to('/approver');
        }

        return redirect()->to('/');
    }
}

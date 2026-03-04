<?php

namespace App\Enums;

enum ApprovalStatus: string
{
    case Approved = 'approved';
    case Rejected = 'rejected';
}

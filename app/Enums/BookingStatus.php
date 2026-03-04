<?php

namespace App\Enums;

enum BookingStatus: string
{
    case Pending = 'pending';
    case ApprovedL1 = 'approved_l1';
    case ApprovedL2 = 'approved_l2';
    case Rejected = 'rejected';
    case Completed = 'completed';
}

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>ADMIN</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Mining Platform"/>
    <meta name="author" content="Mining"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <link rel="shortcut icon" href="{{ asset('images/favicon.ico') }}">

    <link rel="stylesheet" href="{{asset('css/datatables.min.css')}}">
    <link rel="stylesheet" href="{{asset('css/vendor.min.css')}}">
    <link rel="stylesheet" href="{{asset('css/icons.min.css')}}">
    <link rel="stylesheet" href="{{asset('css/app.min.css')}}">
    <link rel="stylesheet" href="{{asset('css/bootstrap-icons.min.css')}}">
    <link rel="stylesheet" href="{{asset('css/custom.css')}}">
    <script src="{{asset('js/config.min.js')}}"></script>

</head>

<body>

<div class="wrapper">

    <header class="topbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <div class="d-flex align-items-center gap-2">

                    <div class="topbar-item">
                        <button type="button" class="button-toggle-menu topbar-button">
                            <i class="bi bi-box fs-24 align-middle"></i>
                        </button>
                    </div>


                </div>

                <div class="d-flex align-items-center gap-1">

                    <div class="topbar-item">
                        <button type="button" class="topbar-button" id="light-dark-mode">
                            <i class="bi bi-moon fs-4 align-middle light-mode"></i>
                            <i class="bi bi-moon-fill fs-4 align-middle dark-mode"></i>
                        </button>
                    </div>


                    <div class="dropdown topbar-item">
                        <a type="button" class="topbar-button" id="page-header-user-dropdown" data-bs-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                                        <span class="d-flex align-items-center">
                                             <span class="me-2">{{ Auth::user()->name }}</span>
                                             <img class="rounded-circle" width="32"
                                                  src="{{ asset('images/users/avatar-1.jpg') }}" alt="">
                                        </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">


                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <button class="dropdown-item text-danger">
                                    <i class="bs bs-log-out fs-18 align-middle me-1"></i>
                                    <span class="align-middle"> {{ __('Log Out') }}</span>
                                </button>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>



    <div class="main-nav">
        <div class="logo-box">

        </div>

        <div class="scrollbar" data-simplebar>
            <ul class="navbar-nav" id="navbar-nav">


                <li class="nav-item">
                    <a class="nav-link" href="{{ __('dashboard') }}">
                        <span class="nav-text"> Dashboard </span>
                    </a>
                </li>

                <li class="menu-title"></li>

                <li class="nav-item">
                    <a class="nav-link" href="{{ route('generalSettings') }}">
                        <span class="nav-icon">
                            <i class="bi bi-list fs-4"></i>
                        </span>
                        <span class="nav-text"> General Settings </span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="{{ route('subscriber') }}">
                        <span class="nav-icon">
                            <i class="bi bi-list fs-4"></i>
                        </span>
                        <span class="nav-text"> Subscriber </span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="{{ route('subscriptionPlan') }}">
                        <span class="nav-icon">
                            <i class="bi bi-list fs-4"></i>
                        </span>
                        <span class="nav-text"> Subscription Plan </span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="{{ route('miningCurrency') }}">
                        <span class="nav-icon">
                            <i class="bi bi-list fs-4"></i>
                        </span>
                        <span class="nav-text"> Mining Currency </span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="{{ route('notification') }}">
                        <span class="nav-icon">
                            <i class="bi bi-list fs-4"></i>
                        </span>
                        <span class="nav-text"> Notification </span>
                    </a>
                </li>


            </ul>
        </div>
    </div>

    <div class="page-content">
        <div class="container-fluid">
            {{ $slot }}
        </div>

        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 text-center">

                    </div>
                </div>
            </div>
        </footer>


    </div>


</div>
<script src="{{asset('js/datatables.min.js')}}"></script>
<script src="{{asset('js/vendor.js')}}"></script>
<script src="{{asset('js/app.js')}}"></script>

<script>
    new DataTable('.table_records');
</script>

</body>

</html>



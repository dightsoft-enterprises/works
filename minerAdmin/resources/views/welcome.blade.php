<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8" />
        <title>ADMIN</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Mining Platform" />
        <meta name="author" content="Mining" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <link rel="shortcut icon" href="{{ asset('images/favicon.ico') }}">

        <link rel="stylesheet" href="{{asset('css/vendor.min.css')}}">
        <link rel="stylesheet" href="{{asset('css/icons.min.css')}}">
        <link rel="stylesheet" href="{{asset('css/app.min.css')}}">
        <link rel="stylesheet" href="{{asset('css/bootstrap-icons.min.css')}}">
        <script src="{{asset('js/config.min.js')}}"></script>
    </head>
    <body class="font-sans antialiased dark:bg-black dark:text-white/50">
        <div class="bg-gray-50 text-black/50 dark:bg-black dark:text-white/50">
            <img id="background" class="absolute -left-20 top-0 max-w-[877px]" src="https://laravel.com/assets/img/welcome/background.svg" alt="Laravel background" />
            <div class="relative min-h-screen flex flex-col items-center justify-center selection:bg-[#FF2D20] selection:text-white">
                <div class="relative w-full max-w-2xl px-6 lg:max-w-7xl">

                    <main class="mt-6">
                    </main>

                    <footer class="py-16 text-center text-sm text-black dark:text-white/70">

                    </footer>
                </div>
            </div>
        </div>
    </body>
</html>

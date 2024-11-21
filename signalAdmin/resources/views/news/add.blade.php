<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('News') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="container">
            <div class="card ">
                <div class="card-header">
                    <h3 class="card-title ">

                        <a href="{{ route('news') }}" class="card-link text-primary text-end">
                            {{ __('View News') }}
                        </a>

                    </h3>

                </div>

                <div class="card-body ">
                    <x-form-response-errors />

                    {!! Form::open(['route' => 'news.add', 'method' => 'POST', 'class' => 'form-horizontal']) !!}

                    <div class="card-header">
                        <h3 class="card-title">{{ __('Add News') }}</h3>
                    </div>

                    <div class="">

                        <div class="form-group my-2">
                            {!! Form::label('header', 'Header:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('header', null, ['class' => 'form-control', 'placeholder' => 'Haeder']) !!}
                            </div>
                        </div>



                        <div class="form-group my-2">
                            {!! Form::label('description', 'Description:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::textarea('description', null, ['class' => 'form-control', 'row' => '3']) !!}
                            </div>
                        </div>



                    </div>

                    <div class="card-footer">
                        <div class="col-sm-offset-2 col-sm-10">
                            {!! Form::submit('Submit', ['class' => 'btn btn-primary']) !!}
                        </div>
                    </div>


                    {!! Form::close() !!}
                </div>



            </div>
        </div>
    </div>
</x-app-layout>

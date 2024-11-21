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

                @if(isset($news))
                <div class="card-body ">
                    <x-form-response-errors />

                    {!! Form::model($news, ['route' => ['news.update', $news->id], 'method' => 'PUT', 'class' => 'form-horizontal']) !!}

                    <div class="card-header">
                        <h3 class="card-title">{{ __('Add News') }}</h3>
                    </div>

                    <div class="">

                        <div class="form-group my-2">
                            {!! Form::label('header', 'Header:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('header', $news->header, ['class' => 'form-control', 'placeholder' => 'Header']) !!}
                            </div>
                        </div>



                        <div class="form-group my-2">
                            {!! Form::label('description', 'Description:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::textarea('description', $news->description, ['class' => 'form-control', 'row' => '3']) !!}
                            </div>
                        </div>



                    </div>

                    <div class="card-footer">
                        <div class="col-sm-offset-2 col-sm-10">
                            {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
                        </div>
                    </div>


                    {!! Form::close() !!}
                </div>

                @endif

            </div>
        </div>
    </div>
</x-app-layout>

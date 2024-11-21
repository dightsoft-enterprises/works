<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Contact') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="container">
            <div class="card ">
                <div class="card-header">
                    <h3 class="card-title ">


                    </h3>

                </div>

                @if(isset($contact))
                <div class="card-body ">
                    <x-form-response-errors />

                    {!! Form::model($contact, ['route' => ['contact.update', $contact->id], 'method' => 'PUT', 'class'
                    => 'form-horizontal']) !!}

                    <div class="card-header">
                        <h3 class="card-title">{{ __('Update') }}</h3>
                    </div>

                    <div class="">

                        <div class="form-group my-2">
                            {!! Form::label('name', 'Name:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('name', $contact->name, ['class' => 'form-control', 'placeholder' =>
                                'Name']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('phone', 'Phone:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('phone', $contact->phone, ['class' => 'form-control', 'placeholder' =>
                                'phone']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('email', 'Email Address:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('email', $contact->email, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('telegram', 'Telegram Link:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('telegram', $contact->telegram, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('address', 'Address:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::textarea('address', null, ['class' => 'form-control', 'row' => '3']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('about', 'About:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::textarea('about', null, ['class' => 'form-control', 'row' => '3']) !!}
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

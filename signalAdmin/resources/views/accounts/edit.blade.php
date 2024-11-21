<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Accounts') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="container">
            <div class="card ">
                <div class="card-header">
                    <h3 class="card-title ">

                        <a href="{{ route('accounts') }}" class="card-link text-primary text-end">
                            {{ __('View Accounts') }}
                        </a>

                    </h3>

                </div>

                @if(isset($accounts))
                <div class="card-body ">
                    <x-form-response-errors />

                    {!! Form::model($accounts, ['route' => ['accounts.update', $accounts->id], 'method' => 'PUT', 'class' => 'form-horizontal']) !!}

                    <div class="card-header">
                        <h3 class="card-title">{{ __('Add Accounts') }}</h3>
                    </div>

                    <div class="">

                        <div class="form-group my-2">
                            {!! Form::label('remark', 'Remark:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('remark', $accounts->remark, ['class' => 'form-control', 'placeholder' => 'remark'])
                                !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('code', 'Code:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('code', $accounts->code, ['class' => 'form-control', 'placeholder' => 'code'])
                                !!}
                            </div>
                        </div>




                        <div class="form-group my-2">
                            {!! Form::label('type', 'Type:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::select('type', [
                                    'DEVICE' => 'DEVICE ACTIVATION',
                                    'BOT1' => 'BOT (FIRST STAGE)',
                                    'BOT2' => 'BOT (SECOND STAGE)',
                                    'SIGNAL1' => 'SIGNAL (FIRST STAGE)',
                                    'SIGNAL2' => 'SIGNAL (SECOND STAGE)'
                                ],  $accounts->type, ['class' => 'form-control']) !!}
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

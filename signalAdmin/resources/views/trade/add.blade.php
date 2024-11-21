<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Trade') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="container">
            <div class="card ">
                <div class="card-header">
                    <h3 class="card-title ">

                        <a href="{{ route('trade') }}" class="card-link text-primary text-end">
                            {{ __('View Trades') }}
                        </a>

                    </h3>

                </div>

                <div class="card-body ">
                    <x-form-response-errors />

                    {!! Form::open(['route' => 'trade.add', 'method' => 'POST', 'class' => 'form-horizontal']) !!}


                    <div class="card-header">
                        <h3 class="card-title">{{ __('Add Trade') }}</h3>
                    </div>

                    <div class="">

                        <div class="form-group my-2">
                            {!! Form::label('name', 'Name:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'BUY ORDER OR
                                SELL ORDER']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('bot', 'Bot:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('bot', null, ['class' => 'form-control', 'placeholder' => 'Bot']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('publishedOn', 'Published On:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::date('publishedOn', null, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('startDate', 'Start Date:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::date('startDate', null, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('endDate', 'End Date:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::date('endDate', null, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('type', 'Type:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::select('type', ['sell' => 'Sell Order', 'buy' => 'Buy Order'], null, ['class'
                                => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('option', 'Option (Sell at/ Buy at):', ['class' => 'col-sm-2
                            control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('option', null, ['class' => 'form-control', 'placeholder' => '1.534'])
                                !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('takeProfit', 'Take Profit:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('takeProfit', null, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('stopLoss', 'Stop Loss:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('stopLoss', null, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('profit', 'Profit:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('profit', null, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('roi', 'ROI:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('roi', null, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('currentPair', 'Current Pair:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('currentPair', null, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('maxDrawDown', 'Max DrawDown:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('maxDrawDown', null, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('status', 'Status:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::select('status', ['running' => 'Running', 'won' => 'Won', 'lost' => 'Lost'],
                                null, ['class' => 'form-control']) !!}
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

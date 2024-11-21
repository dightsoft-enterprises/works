<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Pricing') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="container">
            <div class="card ">
                <div class="card-header">
                    <h3 class="card-title ">

                        <a href="{{ route('pricing') }}" class="card-link text-primary text-end">
                            {{ __('View Pricing') }}
                        </a>

                    </h3>

                </div>

                @if(isset($pricing))
                <div class="card-body ">
                    <x-form-response-errors />

                    {!! Form::model($pricing, ['route' => ['pricing.update', $pricing->id], 'method' => 'PUT', 'class' => 'form-horizontal']) !!}

                    <div class="card-header">
                        <h3 class="card-title">{{ __('Add Pricing') }}</h3>
                    </div>

                    <div class="">

                        <div class="form-group my-2">
                            {!! Form::label('name', 'Name:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('name', $pricing->name, ['class' => 'form-control', 'placeholder' => 'Name']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('amount', 'Amount:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('amount', $pricing->amount, ['class' => 'form-control', 'placeholder' => 'Amount']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('maxDrawDown', 'Max DrawDown:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('maxDrawDown', $pricing->maxDrawDown, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('minDeposit', 'Min Deposit:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('minDeposit', $pricing->minDeposit, ['class' => 'form-control', 'placeholder' => 'Min Deposit']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('maxDeposit', 'Max Deposit:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('maxDeposit', $pricing->maxDeposit, ['class' => 'form-control', 'placeholder' => 'Max Deposit']) !!}
                            </div>
                        </div>


                        <div class="form-group my-2">
                            {!! Form::label('dailyReturns', 'Daily Returns:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('dailyReturns', $pricing->dailyReturns, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('weeklyReturns', 'Weekly Returns:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('weeklyReturns', $pricing->weeklyReturns, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('phoneOrComputer', 'Phone or Computer:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('phoneOrComputer', $pricing->phoneOrComputer, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('deviceLabel', 'Device Names:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('deviceLabel', $pricing->deviceLabel, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('device', 'Device:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('device', $pricing->device, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('noLossTrading', 'no Loss Trading:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('noLossTrading', $pricing->noLossTrading, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('proFirmTrading', 'pro Firm Trading:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('proFirmTrading', $pricing->proFirmTrading, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('newsTrading', 'news Trading:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('newsTrading', $pricing->newsTrading, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('takeProfit', 'take Profit:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('takeProfit', $pricing->takeProfit, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('stopLoss', 'stopLoss:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('stopLoss', $pricing->stopLoss, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('tradingOptimization', 'trading Optimization:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('tradingOptimization', $pricing->tradingOptimization, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('liveDemo', 'live Demo:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('liveDemo', $pricing->liveDemo, ['class' => 'form-control']) !!}
                            </div>
                        </div>

                        <div class="form-group my-2">
                            {!! Form::label('currencyPair', 'currency Pair:', ['class' => 'col-sm-2 control-label']) !!}
                            <div class="col-sm-10">
                                {!! Form::text('currencyPair', $pricing->currencyPair, ['class' => 'form-control']) !!}
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

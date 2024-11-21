<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Pricing') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="container-fluid">
            <div class="card ">
                <div class="card-header">
                    <h3 class="card-title ">
                        <div class="card-text mb-3"> {{ __('Pricing') }}</div>
                        <a href="{{ route('pricing.add') }}" class="card-link text-primary text-end">
                            {{ __('Add New Pricing') }}
                        </a>
                    </h3>

                </div>

                <div class="card-body table-responsive">

                    <table class="table table-striped">
                        <thead>
                            <tr class="thead-light">
                                <th>#</th>

                                <th>{{ __('Name') }}</th>
                                <th>{{ __('Amount') }}</th>
                                <th>{{ __('daily Returns') }}</th>
                                <th>{{ __('weekly Returns') }}</th>
                                <th>{{ __('min Deposit') }}</th>
                                <th>{{ __('max Deposit') }}</th>
                                <th>{{ __('max DrawDown') }}</th>
                                <th>{{ __('phone Or Computer') }}</th>
                                <th>{{ __('Device Label') }}</th>
                                <th>{{ __('Device') }}</th>
                                <th>{{ __('no Loss Trading') }}</th>
                                <th>{{ __('pro Firm Trading') }}</th>
                                <th>{{ __('news Trading') }}</th>
                                <th>{{ __('take Profit') }}</th>
                                <th>{{ __('stop Loss') }}</th>
                                <th>{{ __('trading Optimization') }}</th>
                                <th>{{ __('live Demo') }}</th>
                                <th>{{ __('currency Pair') }}</th>

                                <th>{{ __('Published On') }}</th>
                                <th>{{ __('Action') }}</th>
                            </tr>
                        </thead>
                        <tbody>



                            @isset($pricing)
                            @foreach ($pricing as $key => $price)
                            <tr>
                                <td> {{ ++$key }}</td>


                                <td>{{ $price->name }}</td>
                                <td>{{ $price->amount }}</td>
                                <td>{{ $price->dailyReturns }}</td>
                                <td>{{ $price->weeklyReturns }}</td>
                                <td>{{ $price->minDeposit }}</td>
                                <td>{{ $price->maxDeposit }}</td>
                                <td>{{ $price->maxDrawDown }}</td>
                                <td>{{ $price->phoneOrComputer }}</td>
                                <td>{{ $price->deviceLabel }}</td>
                                <td>{{ $price->device }}</td>
                                <td>{{ $price->noLossTrading }}</td>
                                <td>{{ $price->proFirmTrading }}</td>
                                <td>{{ $price->newsTrading }}</td>
                                <td>{{ $price->takeProfit }}</td>
                                <td>{{ $price->stopLoss }}</td>
                                <td>{{ $price->tradingOptimization }}</td>
                                <td>{{ $price->liveDemo }}</td>
                                <td>{{ $price->currencyPair }}</td>

                                <th>{{ $price->created_at }}</v>

                                <td>
                                    <span>
                                        <a href="{{ URL::to('/pricing/' . $price->id . '/edit') }}"
                                            class="btn btn-sm btn-warning">
                                            {{ _('Edit') }}
                                        </a>
                                    </span>

                                    <span>
                                        <a href="{{ URL::to('/pricing/' . $price->id . '/delete') }}"
                                            class="btn btn-sm btn-danger">
                                            {{ _('Delete') }}
                                        </a>
                                    </span>


                                </td>
                            </tr>

                            @endforeach
                            @endisset

                        </tbody>
                    </table>
                </div>



            </div>
        </div>
    </div>
</x-app-layout>

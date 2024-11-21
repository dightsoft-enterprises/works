<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Trade') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="container-fluid">
            <div class="card ">
                <div class="card-header">
                    <h3 class="card-title ">
                        <div class="card-text mb-3"> {{ __('Trades') }}</div>
                        <a href="{{ route('trade.add') }}" class="card-link text-primary text-end">
                            {{ __('Add New Trades') }}
                        </a>
                    </h3>

                </div>

                <div class="card-body table-responsive">
                    <div>

                        {!! Form::open(['route' => 'trade.search', 'method' => 'POST']) !!}
                        <div class="form-group mb-2">
                            {!! Form::label('startDate', 'Start Date:') !!}
                            {!! Form::date('startDate', null, ['class' => 'form-control']) !!}
                        </div>
                        <div class="form-group mb-2">
                            {!! Form::label('endDate', 'End Date:') !!}
                            {!! Form::date('endDate', null, ['class' => 'form-control']) !!}
                        </div>
                        <div class="form-group mb-3">
                            {!! Form::submit('Search', ['class' => 'btn btn-primary']) !!}
                        </div>
                        {!! Form::close() !!}

                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr class="thead-light">
                                <th>#</th>
                                <th>{{ __('Name') }}</th>
                                <th>{{ __('BOT') }}</th>
                                <th>{{ _('Start Date') }}</th>
                                <th>{{ _('End Date') }}</th>
                                <th>{{ _('Type') }}</th>
                                <th>{{ _('Option') }}</th>
                                <th>{{ _('Take Profit') }}</th>
                                <th>{{ __('Stop Loss') }}</th>
                                <th>{{ __('Profit') }}</th>
                                <th>{{ __('ROI') }}</th>
                                <th>{{ __('Pair') }}</th>
                                <th>{{ __('Max DrawDown') }}</th>
                                <th>{{ __('Status') }}</th>
                                <th>{{ __('Published On') }}</th>
                                <th>{{ __('Action') }}</th>
                            </tr>
                        </thead>
                        <tbody>



                            @isset($trades)
                            @foreach ($trades as $key => $trade)
                            <tr>
                                <td> {{ ++$key }}</td>

                                <td>{{ $trade->name }}</td>
                                <td>{{ $trade->bot }}</td>
                                <td>{{ $trade->startDate }}</td>
                                <td>{{ $trade->endDate }}</td>
                                <td>{{ $trade->type }}</td>
                                <td class="text-wrap" style="">{{ $trade->option }}</td>
                                <td>{{ $trade->takeProfit }}</td>
                                <td>{{ $trade->stopLoss }}</td>
                                <td>{{ $trade->profit }}</td>
                                <td>{{ $trade->roi }}</td>
                                <td>{{ $trade->currentPair }}</td>
                                <td>{{ $trade->maxDrawDown }}</td>

                                <td>
                                    @if ($trade->status == 'running' )
                                    <span class="badge bg-warning p-2 ">{{ __('Running') }}</span>

                                    @elseif ($trade->status == 'won' )
                                    <span class="badge bg-success p-2">{{ __('Won') }}</span>

                                    @elseif ($trade->status == 'lost' )
                                    <span class="badge bg-danger p-2">{{ __('Lost') }}</span>

                                    @else
                                    <span class=""></span>
                                    @endif

                                </td>

                                <th>{{ $trade->publishedOn }}</v>

                                <td>
                                    <span>
                                        <a href="{{ URL::to('/trade/' . $trade->id . '/edit') }}"
                                            class="btn btn-sm btn-warning">
                                            {{ _('Edit') }}
                                        </a>
                                    </span>

                                    <span>
                                        <a href="{{ URL::to('/trade/' . $trade->id . '/delete') }}"
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

<x-app-layout>


    <div class="card ">
        <div class="card-header">
            <h3 class="card-title ">
                {{ __('Mining Currency') }}
            </h3>
            <div class="card-link mt-2">
                <a href="{{ route('miningCurrency.add') }}" class="card-link text-primary text-end">
                    {{ __('Add New Mining Currency') }}
                </a>
            </div>

        </div>

        <div class="card-body table-responsive">
            <x-form-response-errors />
            <table class="table table-striped table-hover table_records">
                <thead>
                <tr class="w-header">
                    <th>#</th>
                    <th class="w-nowrap">{{ __('Status') }}</th>
                    <th class="w-nowrap">{{ __('Subscriber') }}</th>
                    <th class="w-nowrap">{{ __('Name') }}</th>
                    <th class="w-nowrap">{{ __('Code') }}</th>
                    <th class="w-nowrap">{{ __('Trade Amount') }}</th>
                    <th class="w-nowrap">{{ __('Date') }}</th>
                    <th>{{ __('Action') }}</th>
                </tr>
                </thead>
                <tbody>


                @isset($miningCurrency)
                    @foreach ($miningCurrency as $key => $miningCurrencyItem)
                        <tr>
                            <td> {{ ++$key }}</td>
                            <td>
                                @if($miningCurrencyItem->status ==1)
                                    <span class="badge bg-success-subtle text-success py-1 px-2">Active</span>
                                @else
                                    <span class="badge bg-danger-subtle text-danger py-1 px-2">Disabled</span>
                                @endif
                            </td>
                            <td>
                                @if($miningCurrencyItem->userStatus ==1)
                                    <span class="badge bg-success-subtle text-success py-1 px-2">Active</span>
                                @else
                                    <span class="badge bg-danger-subtle text-danger py-1 px-2">Disabled</span>
                                @endif
                            </td>
                            <td>{{ $miningCurrencyItem->name }}</td>
                            <td>{{ $miningCurrencyItem->code }}</td>
                            <td>{{ $miningCurrencyItem->amount }}</td>
                            <td>{{ $miningCurrencyItem->created_at }}</td>

                            <td class="d-flex bg-transparent">
                                <div class="me-1">
                                    <a href="{{ URL::to('/miningCurrency/' . $miningCurrencyItem->id . '/edit') }}"
                                       class="btn btn-sm btn-warning">
                                        {{ ('Edit') }}
                                    </a>
                                </div>
                                <div>
                                    <a href="{{ URL::to('/miningCurrency/' . $miningCurrencyItem->id . '/delete') }}"
                                       class="btn btn-sm btn-danger">
                                        {{ ('Delete') }}
                                    </a>
                                </div>
                            </td>
                        </tr>

                    @endforeach
                @endisset

                </tbody>
            </table>
        </div>

    </div>


</x-app-layout>

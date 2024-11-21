<x-app-layout>


    <div class="card ">
        <div class="card-header">
            <h3 class="card-title ">
                {{ __('Subscribers') }}
            </h3>
            <div class="card-link mt-2">
                <a href="{{ route('subscriber.add') }}" class="card-link text-primary text-end">
                    {{ __('Add New Subscriber') }}
                </a>
            </div>

        </div>

        <div class="card-body table-responsive">
            <x-form-response-errors/>
            <table class="table border table-hover table_records">
                <thead>
                <tr class="w-header">
                    <th>{{ __('Action') }}</th>
                    <th>Id</th>
                    <th class="w-nowrap">{{ __('Status') }}</th>
                    <th class="w-nowrap">{{ __('Approved') }}</th>
                    <th class="w-nowrap">{{ __('Use Default') }}</th>
                    <th class="w-nowrap">{{ __('First Name') }}</th>
                    <th class="w-nowrap">{{ __('Last Name') }}</th>
                    <th class="w-nowrap">{{ __('Phone') }}</th>
                    <th class="w-nowrap">{{ __('Email') }}</th>
                    <th class="w-nowrap">{{ __('Gender') }}</th>
                    <th class="w-nowrap">{{ __('Balance') }}</th>
                    <th class="w-nowrap">{{ __('Limit') }}</th>
                    <th class="w-nowrap">{{ __('Mining Rate') }}</th>

                    <th>{{ __('Withdrawal Limit Message') }}</th>
                    <th>{{ __('Timeout Message') }}</th>
                    <th class="w-nowrap">{{ __('Joined Date') }}</th>

                </tr>
                </thead>
                <tbody>


                @isset($subscriber)
                    @foreach ($subscriber as $key => $subscriberItem)
                        <tr class="bg-white">
                            <td class="d-flex">
                                <div class="me-1">
                                    <a href="{{ URL::to('/subscriber/' . $subscriberItem->id . '/edit') }}"
                                       class="btn btn-sm btn-warning">
                                        {{ ('Edit') }}
                                    </a>
                                </div>

                                <div class="">
                                    <a href="{{ URL::to('/subscriber/' . $subscriberItem->id . '/delete') }}"
                                       class="btn btn-sm btn-danger">
                                        {{ ('Delete') }}
                                    </a>
                                </div>
                            </td>

                            <td> {{ $subscriberItem->id }}</td>
                            <td>
                                @if($subscriberItem->status ==1)
                                    <span class="badge bg-success-subtle text-success py-1 px-2">Active</span>

                                @else
                                    <span class="badge bg-danger-subtle text-danger py-1 px-2">Disabled</span>
                                @endif
                            </td>

                            <td>
                                @if($subscriberItem->approved ==1)
                                    <span class="badge bg-success-subtle text-success py-1 px-2">Approved</span>

                                @else
                                    <span class="badge bg-danger-subtle text-danger py-1 px-2">Pending</span>
                                @endif
                            </td>

                            <td>
                                @if($subscriberItem->useDefault ==1)
                                    <span class="badge bg-success-subtle text-success py-1 px-2">Active</span>

                                @else
                                    <span class="badge bg-danger-subtle text-danger py-1 px-2">Disabled</span>
                                @endif
                            </td>


                            <td>{{ $subscriberItem->firstName }}</td>
                            <td>{{ $subscriberItem->lastName }}</td>
                            <td>{{ $subscriberItem->phone }}</td>
                            <td>{{ $subscriberItem->email }}</td>
                            <td>{{ $subscriberItem->gender }}</td>
                            <td>
                                <table class="table">
                                    <tbody>
                                    <tr>
                                        <td>Bitcoin Balance</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->bitcoin }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ethereum Balance</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->ethereum }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Litecoin Balance</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->litecoin }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tron Balance</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->tron }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Binance Balance</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->binance }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tether Balance</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->tether }}</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>

                            <td>
                                <table class="table">
                                    <tbody>
                                    <tr>
                                        <td>Bitcoin Rate</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->bitcoinRate }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ethereum Rate</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->ethereumRate }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Litecoin Rate</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->litecoinRate }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tron Balance</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->tronRate }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Binance Rate</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->binanceRate }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tether Rate</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->tether }}</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>

                            <td>
                                <table class="table">
                                    <tbody>
                                    <tr>
                                        <td>Bitcoin Limit</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->bitcoinLimit }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ethereum Limit</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->ethereumLimit }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Litecoin Limit</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->litecoinLimit }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tron Limit</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->tronLimit }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Binance Limit</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->binanceLimit }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tether Limit</td>
                                        <td><span
                                                class="badge bg-success-subtle text-success py-1 px-2">{{ $subscriberItem->tetherLimit }}</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>

                            <td>{{ $subscriberItem->withdrawalMessage }}</td>
                            <td>{{ $subscriberItem->timeoutMessage }}</td>
                            <td>{{ $subscriberItem->created_at }}</td>

                        </tr>

                    @endforeach
                @endisset

                </tbody>
            </table>
        </div>


    </div>


</x-app-layout>

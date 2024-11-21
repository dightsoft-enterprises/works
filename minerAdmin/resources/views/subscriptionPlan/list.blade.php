<x-app-layout>


    <div class="card ">
        <div class="card-header">
            <h3 class="card-title ">
                {{ __('Subscription Plans') }}
            </h3>
            <div class="card-link mt-2">
                <a href="{{ route('subscriptionPlan.add') }}" class="card-link text-primary text-end">
                    {{ __('Add New Subscription Plan') }}
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
                    <th class="w-nowrap">{{ __('Name') }}</th>
                    <th class="w-nowrap">{{ __('Subtitle') }}</th>
                    <th class="w-nowrap">{{ __('Amount') }}</th>
                    <th class="w-nowrap">{{ __('Features') }}</th>
                    <th class="w-nowrap">{{ __('Payment') }}</th>
                    <th class="w-nowrap">{{ __('Date') }}</th>
                    <th>{{ __('Action') }}</th>
                </tr>
                </thead>
                <tbody>


                @isset($subscriptionPlan)
                    @foreach ($subscriptionPlan as $key => $subscriptionPlanItem)
                        <tr>
                            <td> {{ ++$key }}</td>
                            <td>
                                @if($subscriptionPlanItem->status ==1)
                                    <span class="badge bg-success-subtle text-success py-1 px-2">Active</span>

                                @else
                                    <span class="badge bg-danger-subtle text-danger py-1 px-2">Disabled</span>
                                @endif


                            </td>
                            <td>{{ $subscriptionPlanItem->name }}</td>
                            <td>{{ $subscriptionPlanItem->subtitle }}</td>
                            <td>{{ $subscriptionPlanItem->amount }}</td>
                            <td>{{ $subscriptionPlanItem->features }}</td>
                            <td>{{ $subscriptionPlanItem->payment }}</td>
                            <td>{{ $subscriptionPlanItem->created_at }}</td>

                            <td class="d-flex bg-transparent">
                                <div class="me-1">
                                    <a href="{{ URL::to('/subscriptionPlan/' . $subscriptionPlanItem->id . '/edit') }}"
                                       class="btn btn-sm btn-warning">
                                        {{ ('Edit') }}
                                    </a>
                                </div>

                                <div>
                                    <a href="{{ URL::to('/subscriptionPlan/' . $subscriptionPlanItem->id . '/delete') }}"
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

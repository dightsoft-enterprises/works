<x-app-layout>


    <div class="card ">
        <div class="card-header">
            <h3 class="card-title ">
                {{ __('Notification') }}
            </h3>
            <div class="card-link mt-2">
                <a href="{{ route('notification.add') }}" class="card-link text-primary text-end">
                    {{ __('Add New Notification') }}
                </a>
            </div>

        </div>

        <div class="card-body table-responsive">
            <x-form-response-errors />
            <table class="table table-striped table-hover table_records">
                <thead>
                <tr class="w-header">
                    <th>#</th>
                    <th class="w-nowrap">{{ __('Header') }}</th>
                    <th class="w-nowrap">{{ __('Message') }}</th>
                    <th class="w-nowrap">{{ __('Date') }}</th>
                    <th>{{ __('Action') }}</th>
                </tr>
                </thead>
                <tbody>


                @isset($notification)
                    @foreach ($notification as $key => $notificationItem)
                        <tr>
                            <td> {{ ++$key }}</td>
                            <td>{{ $notificationItem->header }}</td>
                            <td>{{ $notificationItem->message }}</td>
                            <td>{{ $notificationItem->created_at }}</td>

                            <td class="d-flex bg-transparent">
                                <div class="me-1">
                                    <a href="{{ URL::to('/notification/' . $notificationItem->id . '/edit') }}"
                                       class="btn btn-sm btn-warning">
                                        {{ ('Edit') }}
                                    </a>
                                </div>

                                <div>
                                    <a href="{{ URL::to('/notification/' . $notificationItem->id . '/delete') }}"
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

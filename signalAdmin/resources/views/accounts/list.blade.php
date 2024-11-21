<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Account') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="container-fluid">
            <div class="card ">
                <div class="card-header">
                    <h3 class="card-title ">
                        <div class="card-text mb-3"> {{ __('Account') }}</div>
                        <a href="{{ route('accounts.add') }}" class="card-link text-primary text-end">
                            {{ __('Add New Account') }}
                        </a>
                    </h3>

                </div>

                <div class="card-body table-responsive">

                    <table class="table table-striped">
                        <thead>
                            <tr class="thead-light">
                                <th>#</th>
                                <th>{{ __('Remark') }}</th>
                                <th>{{ __('Code') }}</th>
                                <th>{{ __('Type') }}</th>
                                <th>{{ __('Published On') }}</th>
                                <th>{{ __('Action') }}</th>
                            </tr>
                        </thead>
                        <tbody>



                            @isset($accounts)
                            @foreach ($accounts as $key => $account)
                            <tr>
                                <td> {{ ++$key }}</td>

                                <td>{{ $account->remark }}</td>

                                <td>{{ $account->code }}</td>
                                <td>{{ $account->type }}</td>
                                <th>{{ $account->created_at }}</v>

                                <td>
                                    <span>
                                        <a href="{{ URL::to('/accounts/' . $account->id . '/edit') }}"
                                            class="btn btn-sm btn-warning">
                                            {{ _('Edit') }}
                                        </a>
                                    </span>

                                    <span>
                                        <a href="{{ URL::to('/accounts/' . $account->id . '/delete') }}"
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

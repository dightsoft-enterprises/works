<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('News') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="container-fluid">
            <div class="card ">
                <div class="card-header">
                    <h3 class="card-title ">
                        <div class="card-text mb-3"> {{ __('News') }}</div>
                        <a href="{{ route('news.add') }}" class="card-link text-primary text-end">
                            {{ __('Add New News') }}
                        </a>
                    </h3>

                </div>

                <div class="card-body table-responsive">

                    <table class="table table-striped">
                        <thead>
                            <tr class="thead-light">
                                <th>#</th>
                                <th>{{ __('Header') }}</th>

                                <th>{{ __('description') }}</th>
                                <th>{{ __('Published On') }}</th>
                                <th>{{ __('Action') }}</th>
                            </tr>
                        </thead>
                        <tbody>



                            @isset($news)
                            @foreach ($news as $key => $newItem)
                            <tr>
                                <td> {{ ++$key }}</td>

                                <td>{{ $newItem->header }}</td>

                                <td>{{ $newItem->description }}</td>
                                <th>{{ $newItem->created_at }}</v>

                                <td>
                                    <span>
                                        <a href="{{ URL::to('/news/' . $newItem->id . '/edit') }}"
                                            class="btn btn-sm btn-warning">
                                            {{ _('Edit') }}
                                        </a>
                                    </span>

                                    <span>
                                        <a href="{{ URL::to('/news/' . $newItem->id . '/delete') }}"
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

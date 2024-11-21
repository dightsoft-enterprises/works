<x-app-layout>

    <div class="card ">
        <div class="card-header">
            <h3 class="card-title mb-1 anchor">
                {{ __('Mining Currency') }}
            </h3>

            <div class="card-link mt-2">
                <a href="{{ route('miningCurrency') }}" class="card-link text-primary text-end">
                    {{ __('View Mining Currency') }}
                </a>
            </div>
        </div>


        <x-form-response-errors/>

        <form method="POST" action="{{ route('miningCurrency.add') }}" class="card-body">
            @csrf
            @method('POST')
            <div class="mb-3">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name"
                       value="{{old('name')}}" required>
            </div>
            <div class="mb-3">
                <label for="code">Code</label>
                <input type="text" class="form-control" id="code" name="code"
                       value="{{old('code')}}" required>
            </div>

            <div class="mb-3">
                <label for="amount">Trade Amount</label>
                <input type="text" class="form-control" id="amount" name="amount"
                       value="{{old('amount')}}" required>
            </div>

            <div class="mb-3">
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" name="status" role="switch" value="1"
                           id="flexSwitchCheckChecked">
                    <label class="form-check-label" for="flexSwitchCheckChecked">Status</label>
                </div>
            </div>

            <div class="mb-3">
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" name="userStatus" role="switch" value="1"
                           id="flexSwitchCheckChecked">
                    <label class="form-check-label" for="flexSwitchCheckChecked">User Status</label>
                </div>
            </div>


            <div class="mt-3 text-end">
                <button class="btn btn-primary ">
                    Submit
                </button>
            </div>

        </form>


    </div>
</x-app-layout>

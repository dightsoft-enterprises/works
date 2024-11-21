<x-app-layout>

    <div class="card ">
        <div class="card-header">
            <h3 class="card-title mb-1 anchor">
                {{ __('Subscription Plan') }}
            </h3>

            <div class="card-link mt-2">
                <a href="{{ route('subscriptionPlan') }}" class="card-link text-primary text-end">
                    {{ __('View Subscription Plan') }}
                </a>
            </div>
        </div>


        <x-form-response-errors/>

        <form method="POST" action="{{ route('subscriptionPlan.add') }}" class="card-body">
            @csrf
            @method('POST')
            <div class="mb-3">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name"
                       value="{{old('name')}}" required>
            </div>
            <div class="mb-3">
                <label for="subtitle">Subtitle</label>
                <input type="text" class="form-control" id="subtitle" name="subtitle"
                       value="{{old('subtitle')}}" required>
            </div>
            <div class="mb-3">
                <label for="amount">Amount</label>
                <input type="text" class="form-control" id="amount" name="amount" value="{{old('amount')}}"
                       required>
            </div>

            <div class="mb-3">
                <label for="features">Features </label>
                <input type="text" class="form-control"  name="features" value="{{old('features')}}"
                       required id="choices-text-unique-values" data-choices data-choices-text-unique-true >

            </div>


            <div class="mb-3">
                <label for="payment">How To pay</label>
                <textarea rows="3" class="form-control" id="payment" name="payment">{{old('payment')}}</textarea>

            </div>

            <div class="mb-3">
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" name="status" role="switch" value="1"
                           id="flexSwitchCheckChecked">
                    <label class="form-check-label" for="flexSwitchCheckChecked">Status</label>
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

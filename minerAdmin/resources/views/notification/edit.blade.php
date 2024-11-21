<x-app-layout>

    <div class="card ">
        <div class="card-header">
            <h3 class="card-title mb-1 anchor">
                {{ __('Notification') }}
            </h3>

            <div class="card-link mt-2">
                <a href="{{ route('notification') }}" class="card-link text-primary text-end">
                    {{ __('View Notification') }}
                </a>
            </div>
        </div>


        <x-form-response-errors/>

        <form method="POST" action="{{ route('notification.update',  $notification->id) }}" class="card-body">
            @csrf
            @method('PUT')
            <div class="mb-3">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="header" name="header"
                       value="{{$notification->header}}" required>
            </div>


            <div class="mb-3">
                <label for="timeoutMessage">Message</label>
                <textarea rows="3" class="form-control" id="message" name="message">{{$notification->message}}</textarea>
            </div>

            <div class="mt-3 text-end">
                <button class="btn btn-primary ">
                    Submit
                </button>
            </div>

        </form>


    </div>
</x-app-layout>

<div>
   @if(session('success'))
        <div class="alert alert-success m-3" role="alert">
            {{ session('success') }}
        </div>
    @else

        @if(session('error'))
            <div class="alert alert-danger m-3" role="alert">
                {{ session('error') }}
            </div>
        @endif

   @endif

   @if($errors->any())
   <div class="alert alert-danger m-3" role="alert">
      <ul>
          @foreach ($errors->all() as $error)
              <li>{{ $error }}</li>
          @endforeach
      </ul>
   </div>
  @endif
</div>

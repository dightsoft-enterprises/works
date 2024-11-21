<x-app-layout>

    <div class="card ">
        <div class="card-header">
            <h3 class="card-title mb-1 anchor">
                {{ __('Subscriber') }}
            </h3>

            <div class="card-link mt-2">
                <a href="{{ route('subscriber') }}" class="card-link text-primary text-end">
                    {{ __('View Subscribers') }}
                </a>
            </div>
        </div>

        @if(isset($subscriber))

            <x-form-response-errors/>

            <form method="POST" action="{{ route('subscriber.update',  $subscriber->id) }}" class="card-body">
                @csrf
                @method('PUT')

                <div class="mb-3">
                    <label for="firstName">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName"
                           value="{{$subscriber->firstName}}" required>
                </div>
                <div class="mb-3">
                    <label for="lastName">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName"
                           value="{{$subscriber->lastName}}" required>
                </div>
                <div class="mb-3">
                    <label for="phone">Phone Number</label>
                    <input type="tel" class="form-control" id="phone" name="phone" value="{{$subscriber->phone}}"
                           required>
                </div>

                <div class="mb-3">
                    <label for="email">Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" value="{{$subscriber->email}}"
                           required>
                </div>

                <div class="mb-3">
                    <label for="gender">Gender</label>
                    <select class="form-control" data-choices name="gender" id="choices-single-default">
                        <option value="{{$subscriber->gender}}">{{$subscriber->gender}}</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>

                </div>

                <div class="mb-3">
                    <label for="password">Password</label>
                    <input type="text" class="form-control" id="password" name="password"
                           value="{{$subscriber->password}}" required>
                </div>


                <div class="mb-3">
                    <label for="password">Coin Paid</label>
                    <select class="form-control" data-choices name="currency[]" id="choices-single-default" multiple>
                        <option value=""></option>
                        @if(isset($appCurrency))
                            @foreach($appCurrency as $key => $option)
                                @php
                                    $selected = false;
                                @endphp
                                @if($subscriber->currency != null)
                                    @foreach(json_decode($subscriber->currency) as $item)
                                        @php

                                            if($item == $key){
                                                $selected = true;
                                            }
                                        @endphp
                                    @endforeach
                                @endif


                                <option value="{{$key}}" {{ $selected ? 'selected' : '' }}>{{$option}}</option>

                            @endforeach
                        @endif
                    </select>
                </div>

                <div class="row g-2">
                    <div class="col-sm-12 col-md-12 col-xl-4">
                        <div class="mb-3">
                            <h3>
                                Coin Balance
                            </h3>
                            <hr/>
                        </div>
                        <div class="mb-3">
                            <label>Bitcoin Balance</label>
                            <input type="text" class="form-control" id="bitcoin" name="bitcoin"
                                   value="{{$subscriber->bitcoin}}" required>
                        </div>
                        <div class="mb-3">
                            <label>Ethereum Balance</label>
                            <input type="text" class="form-control" id="ethereum" name="ethereum"
                                   value="{{$subscriber->ethereum}}" required>
                        </div>
                        <div class="mb-3">
                            <label>Litecoin Balance</label>
                            <input type="text" class="form-control" id="litecoin" name="litecoin"
                                   value="{{$subscriber->litecoin}}" required>
                        </div>
                        <div class="mb-3">
                            <label>Tron Balance</label>
                            <input type="text" class="form-control" id="tron" name="tron"
                                   value="{{$subscriber->tron}}" required>
                        </div>
                        <div class="mb-3">
                            <label>Binance Balance</label>
                            <input type="text" class="form-control" id="binance" name="binance"
                                   value="{{$subscriber->binance}}" required>
                        </div>
                        <div class="mb-3">
                            <label>Tether Balance</label>
                            <input type="text" class="form-control" id="tether" name="tether"
                                   value="{{$subscriber->tether}}" required>
                        </div>

                    </div>

                    <div class="col-sm-12 col-md-12 col-xl-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="">
                                    <div class="mb-3">
                                        <h3>
                                            Coin Increase Rate
                                        </h3>
                                        <hr/>
                                    </div>

                                    <div class="mb-3">
                                        <label>Bitcoin Rate</label>
                                        <input type="text" class="form-control" id="bitcoinRate" name="bitcoinRate"
                                               value="{{$subscriber->bitcoinRate}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Ethereum Rate</label>
                                        <input type="text" class="form-control" id="ethereumRate" name="ethereumRate"
                                               value="{{$subscriber->ethereumRate}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Litecoin Rate</label>
                                        <input type="text" class="form-control" id="litecoinRate" name="litecoinRate"
                                               value="{{$subscriber->litecoinRate}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Tron Rate</label>
                                        <input type="text" class="form-control" id="tronRate" name="tronRate"
                                               value="{{$subscriber->tronRate}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Binance Rate</label>
                                        <input type="text" class="form-control" id="binanceRate" name="binanceRate"
                                               value="{{$subscriber->binanceRate}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Tether Rate</label>
                                        <input type="text" class="form-control" id="tetherRate" name="tetherRate"
                                               value="{{$subscriber->tetherRate}}" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 col-md-12 col-xl-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="">
                                    <div class="mb-3">
                                        <h3>
                                            Coin Withdrawal Limit
                                        </h3>
                                        <hr/>
                                    </div>

                                    <div class="mb-3">
                                        <label>Bitcoin Limit</label>
                                        <input type="text" class="form-control" id="bitcoinLimit" name="bitcoinLimit"
                                               value="{{$subscriber->bitcoinLimit}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Ethereum Limit</label>
                                        <input type="text" class="form-control" id="ethereumLimit" name="ethereumLimit"
                                               value="{{$subscriber->ethereumLimit}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Litecoin Limit</label>
                                        <input type="text" class="form-control" id="litecoinLimit" name="litecoinLimit"
                                               value="{{$subscriber->litecoinLimit}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Tron Limit</label>
                                        <input type="text" class="form-control" id="tronLimit" name="tronLimit"
                                               value="{{$subscriber->tronLimit}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Binance Limit</label>
                                        <input type="text" class="form-control" id="binanceLimit" name="binanceLimit"
                                               value="{{$subscriber->binanceLimit}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Tether Limit</label>
                                        <input type="text" class="form-control" id="tetherLimit" name="tetherLimit"
                                               value="{{$subscriber->tetherLimit}}" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="mb-3">
                    <label for="withdrawalLimit">Withdrawal Limit Error Message</label>
                    <textarea rows="3" class="form-control" id="withdrawalMessage"
                              name="withdrawalMessage">{{$subscriber->withdrawalMessage}}</textarea>
                </div>

                <div class="mb-3">
                    <label for="timeoutMessage">timeout Limit Message</label>
                    <textarea rows="3" class="form-control" id="timeoutMessage"
                              name="timeoutMessage">{{$subscriber->timeoutMessage}}</textarea>

                </div>

                <div class="mb-3">
                    <label class="form-label">Timeout (Seconds)</label>
                    <input type="text" name="timeout" class="form-control"
                           value="{{$subscriber->timeout}}"
                           required>
                </div>

                <div class="mb-3">
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" name="status" role="switch" value="1"
                               id="flexSwitchCheckChecked" {{$subscriber->status ==1 ? 'checked':''}} >
                        <label class="form-check-label" for="flexSwitchCheckChecked">Status</label>
                    </div>
                </div>

                <div class="mb-3">
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" name="approved" role="switch" value="1"
                               id="flexSwitchCheckChecked" {{$subscriber->approved ==1 ? 'checked':''}} >
                        <label class="form-check-label" for="flexSwitchCheckChecked">Approved</label>
                    </div>
                </div>

                <div class="mb-3">
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" name="useDefault" role="switch" value="1"
                               id="flexSwitchCheckChecked" {{$subscriber->useDefault ==1 ? 'checked':''}} >
                        <label class="form-check-label" for="flexSwitchCheckChecked">Use Default Mining Settings</label>
                    </div>
                </div>


                <div class="mt-3 text-end">
                    <button class="btn btn-primary ">
                        Submit
                    </button>
                </div>

            </form>

        @endif

    </div>
</x-app-layout>

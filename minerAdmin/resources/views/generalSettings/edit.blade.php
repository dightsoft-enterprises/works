<x-app-layout>


        <div class="card-header">
            <h3 class="card-title mb-1 anchor">
                {{ __('GENERAL SETTINGS') }}
            </h3>
        </div>

        @if(isset($generalSettings))

            <x-form-response-errors/>

            <form method="POST" action="{{ route('generalSettings.update',  $generalSettings->id) }}" >
                @csrf
                @method('PUT')

                <div class="row g-3">

                    <div class="col-sm-12 col-md-12 col-xl-6">
                        <div class="card card-stretch">
                            <div class="card-body">
                                <div class="">

                                    <div class="mb-3">
                                        <h3>
                                            General setup
                                        </h3>
                                        <hr/>
                                    </div>

                                    <div class="mb-3">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" name="emailVerification"
                                                   role="switch"
                                                   value="1"
                                                {{$generalSettings->emailVerification ==1 ? 'checked':''}} >
                                            <label class="form-check-label">User Email verification</label>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Company Name</label>
                                        <input type="text" name="name" class="form-control"
                                               value="{{$generalSettings->name}}"
                                               required>
                                    </div>


                                    <div class="mb-3">
                                        <label class="form-label">Support</label>
                                        <input type="text" name="support" class="form-control"
                                               value="{{$generalSettings->support}}"
                                               required>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 col-md-12 col-xl-6">
                        <div class="card card-stretch">
                            <div class="card-body">
                                <div class="">

                                    <div class="mb-3">
                                        <h3>
                                            APP Limit and Error Message
                                        </h3>
                                        <hr/>
                                    </div>


                                    <div class="mb-3">
                                        <label for="withdrawalLimit">Withdrawal Limit Error Message</label>
                                        <textarea rows="3" class="form-control" id="withdrawalMessage"
                                                  name="withdrawalMessage">{{$generalSettings->timeoutMessage}}</textarea>
                                    </div>

                                    <div class="mb-3">
                                        <label for="timeoutMessage">timeout Limit Message</label>
                                        <textarea rows="3" class="form-control" id="timeoutMessage"
                                                  name="timeoutMessage">{{$generalSettings->timeoutMessage}}</textarea>

                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 col-md-12 col-xl-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="">
                                    <div class="mb-3">
                                        <h3>
                                            Mining Settings
                                        </h3>
                                        <hr/>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Network Percentage</label>
                                        <input type="text" name="networkPercentage" class="form-control"
                                               value="{{$generalSettings->networkPercentage}}"
                                               required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Network HashRate</label>
                                        <input type="text" name="networkHashRate" class="form-control"
                                               value="{{$generalSettings->networkHashRate}}"
                                               required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Pool Hash Rate</label>
                                        <input type="text" name="poolHashRate" class="form-control"
                                               value="{{$generalSettings->poolHashRate}}"
                                               required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Miners</label>
                                        <input type="text" name="miners" class="form-control"
                                               value="{{$generalSettings->miners}}"
                                               required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Online</label>
                                        <input type="text" name="online" class="form-control"
                                               value="{{$generalSettings->online}}"
                                               required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Current Effort</label>
                                        <input type="text" name="currentEffort" class="form-control"
                                               value="{{$generalSettings->currentEffort}}"
                                               required>
                                    </div>


                                    <div class="mb-3">
                                        <label class="form-label">BlockFound</label>
                                        <input type="text" name="blockFound" class="form-control"
                                               value="{{$generalSettings->blockFound}}"
                                               required>
                                    </div>


                                    <div class="mb-3">
                                        <label class="form-label">Timeout</label>
                                        <input type="text" name="timeout" class="form-control"
                                               value="{{$generalSettings->timeout}}"
                                               required>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 col-md-12 col-xl-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="">
                                    <div class="mb-3">
                                        <h3>
                                            App Home Page
                                        </h3>
                                        <hr/>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Header</label>
                                        <input type="text" name="header" class="form-control"
                                               value="{{$generalSettings->header}}"
                                               required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="message">Home Message</label>
                                        <textarea rows="3" class="form-control" id="message"
                                                  name="message">{{$generalSettings->timeoutMessage}}</textarea>

                                    </div>


                                    <div class="mb-3">
                                        <h3>
                                            Email Settings
                                        </h3>
                                        <hr/>
                                    </div>


                                    <div class="mb-3">
                                        <label class="form-label">Smtp Server</label>
                                        <input type="text" name="smtpServer" class="form-control"
                                               value="{{$generalSettings->smtpServer}}"
                                               required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Smtp Username</label>
                                        <input type="text" name="smtpUsername" class="form-control"
                                               value="{{$generalSettings->smtpUsername}}"
                                               required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Smtp Email From</label>
                                        <input type="text" name="smtpEmail" class="form-control"
                                               value="{{$generalSettings->smtpEmail}}"
                                               required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Smtp Security</label>
                                        <input type="text" name="smtpSecurity" class="form-control"
                                               value="{{$generalSettings->smtpSecurity}}"
                                               required>
                                    </div>

                                    <div class="mb-3">
                                            <label class="form-label">Smtp Port</label>
                                        <input type="text" name="smtpPort" class="form-control"
                                               value="{{$generalSettings->smtpPort}}"
                                               required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Smtp Password</label>
                                        <input type="text" name="smtpPassword" class="form-control"
                                               value="{{$generalSettings->smtpPassword}}"
                                               required>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-sm-12 col-md-12 col-xl-6">
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
                                               value="{{$generalSettings->bitcoinRate}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Ethereum Rate</label>
                                        <input type="text" class="form-control" id="ethereumRate" name="ethereumRate"
                                               value="{{$generalSettings->ethereumRate}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Litecoin Rate</label>
                                        <input type="text" class="form-control" id="litecoinRate" name="litecoinRate"
                                               value="{{$generalSettings->litecoinRate}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Tron Rate</label>
                                        <input type="text" class="form-control" id="tronRate" name="tronRate"
                                               value="{{$generalSettings->tronRate}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Binance Rate</label>
                                        <input type="text" class="form-control" id="binanceRate" name="binanceRate"
                                               value="{{$generalSettings->binanceRate}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Tether Rate</label>
                                        <input type="text" class="form-control" id="tetherRate" name="tetherRate"
                                               value="{{$generalSettings->tetherRate}}" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 col-md-12 col-xl-6">
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
                                               value="{{$generalSettings->bitcoinLimit}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Ethereum Limit</label>
                                        <input type="text" class="form-control" id="ethereumLimit" name="ethereumLimit"
                                               value="{{$generalSettings->ethereumLimit}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Litecoin Limit</label>
                                        <input type="text" class="form-control" id="litecoinLimit" name="litecoinLimit"
                                               value="{{$generalSettings->litecoinLimit}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Tron Limit</label>
                                        <input type="text" class="form-control" id="tronLimit" name="tronLimit"
                                               value="{{$generalSettings->tronLimit}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Binance Limit</label>
                                        <input type="text" class="form-control" id="binanceLimit" name="binanceLimit"
                                               value="{{$generalSettings->binanceLimit}}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Tether Limit</label>
                                        <input type="text" class="form-control" id="tetherLimit" name="tetherLimit"
                                               value="{{$generalSettings->tetherLimit}}" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>


                <div class="mt-3 text-end">
                    <button class="btn btn-primary ">
                        Submit
                    </button>
                </div>

            </form>

        @endif


</x-app-layout>

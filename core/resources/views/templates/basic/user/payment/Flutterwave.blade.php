@extends($activeTemplate . 'layouts.master')

@section('content')
    <div class="container padding-top padding-bottom">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <h2 class="title"><span>@lang('Payment Preview')</span></h2>
                        <img src="{{ $deposit->gatewayCurrency()->methodImage() }}" class="card-img-top"
                            alt="@lang('Image')" class="w-100">
                    </div>
                    <div class="col-md-8">
                        <h3>@lang('Please Pay') {{ showAmount($deposit->final_amo) }} {{ __($deposit->method_currency) }}</h3>
                        <h3 class="my-3">@lang('To Get') {{ showAmount($deposit->amount) }} {{ __($general->cur_text) }}
                        </h3>
                        <button type="button" class="btn btn-success mt-4 btn-custom2 " id="btn-confirm"
                            onClick="payWithXendit()">@lang('Pay Now')</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script>
        "use strict"
        var btn = document.querySelector("#btn-confirm");
        btn.setAttribute("type", "button");

        function payWithXendit() {
            // Arahkan user ke URL invoice Xendit
            window.location.href = "{{ $invoice_url }}";
        }
    </script>
@endpush

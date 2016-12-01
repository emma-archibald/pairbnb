$( document ).ready(function() {

var client_token;
$.ajax({
  dataType: 'json',
  url: "/payments/client_token",
  cache: false
}).always(function( html ) {
    client_token = html.responseText;
    braintree.client.create({
      // Replace this with your own authorization.
      authorization: client_token
    }, function (clientErr, clientInstance) {
      if (clientErr) {
        // Handle error in client creation
        return;
      }

      braintree.hostedFields.create({
        client: clientInstance,
        styles: {
          'input': {
            'font-size': '14pt'
          },
          'input.invalid': {
            'color': 'red'
          },
          'input.valid': {
            'color': 'green'
          }
        },
        fields: {
          number: {
            selector: '#card-number',
            placeholder: '4111 1111 1111 1111'
          },
          cvv: {
            selector: '#cvv',
            placeholder: '123'
          },
          expirationDate: {
            selector: '#expiration-date',
            placeholder: '10/2019'
          }
        }
      }, function (hostedFieldsErr, hostedFieldsInstance) {
        if (hostedFieldsErr) {

          return;
        }

        var submit = document.querySelector('#submitBtn');
        submit.removeAttribute('disabled');

        var form = document.querySelector('#checkout-form');
        form.addEventListener('submit', function (event) {
          hostedFieldsInstance.tokenize(function (tokenizeErr, payload) {
            if (tokenizeErr) {
              alert(tokenizeErr);

              return;
            }

            document.querySelector('input[name="payment-method-nonce"]').value = payload.nonce;
            form.submit();
          });
          event.preventDefault();

        }, false);
      });
    });

});
});

import 'package:flutter/material.dart';
import 'package:mvpassessmenttest/ViewModel/add_payment_view_model.dart';
import 'package:mvpassessmenttest/ViewModel/checkout_view_model.dart';
import 'package:provider/provider.dart';

class AddPaymentView extends StatelessWidget{
@override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(),
  body: Column(
    children: [
      customFieldContainerForPaymentSelection(context)
    ],
  ),
);
  }
}

Widget customFieldContainerForPaymentSelection(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
    
  child:  _buildPaymentMethodOptions(context)
    
        
      ),
    );
}

Widget _buildPaymentMethodOptions(BuildContext context) {
  final viewModel = Provider.of<AddPaymentViewModel>(context);

  return Column(
    children: [
      RadioListTile(
        title: const Text('UPI'),
        value: 'UPI',
        groupValue: viewModel.selectedPaymentmethod,
        onChanged: (value) => viewModel.updateSelectedpaymentMethod(value!),
      ),
      if (viewModel.selectedPaymentmethod == 'UPI') _buildUPIOptions(context),

 Divider(height: 1, color: Colors.grey),
      RadioListTile(
        title: const Text('Debit/Credit Card'),
        value: 'Credit/Debit Card',
        groupValue: viewModel.selectedPaymentmethod,
        onChanged: (value) => viewModel.updateSelectedpaymentMethod(value!),
      ),
      if (viewModel.selectedPaymentmethod == 'Credit/Debit Card')
        _buildCardOptions(context),

 Divider(height: 1, color: Colors.grey),
      RadioListTile(
        title: const Text('Other Options'),
        value: 'Other',
        groupValue: viewModel.selectedPaymentmethod,
        onChanged: (value) => viewModel.updateSelectedOtherMethod(value!),
      ),
      if (viewModel.selectedPaymentmethod == 'Other')
        _buildOtherOptions(),
    ],
  );
}

Widget _buildUPIOptions(BuildContext context) {
  final viewModel = Provider.of<AddPaymentViewModel>(context);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select UPI App:', style: TextStyle(fontWeight: FontWeight.bold)),
        RadioListTile(
          title: const Text('Google Pay'),
          value: 'Google Pay',
          groupValue: viewModel.selectedUPI,
          onChanged: (value) => viewModel.updateSelectedUPI(value!),
        ),
        RadioListTile(
          title: const Text('PhonePe'),
          value: 'PhonePe',
          groupValue: viewModel.selectedUPI,
          onChanged: (value) => viewModel.updateSelectedUPI(value!),
        ),
        RadioListTile(
          title: const Text('Add Another UPI'),
          value: 'Add UPI',
          groupValue: viewModel.selectedUPI,
          onChanged: (value) => viewModel.updateSelectedUPI(value!),
        ),
      ],
    ),
  );
}

Widget _buildCardOptions(BuildContext context) {
  final viewModel = Provider.of<AddPaymentViewModel>(context);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Card Option:', style: TextStyle(fontWeight: FontWeight.bold)),
        RadioListTile(
          title: const Text('Saved Card'),
          value: 'Saved Card',
          groupValue: viewModel.selectedCard,
          onChanged: (value) => viewModel.updateSelectedCard(value!),
        ),
        RadioListTile(
          title: const Text('Add New Card'),
          value: 'Add Card',
          groupValue: viewModel.selectedCard,
          onChanged: (value) => viewModel.updateSelectedCard(value!),
        ),
      ],
    ),
  );
}

Widget _buildOtherOptions() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Other Payment Options:', style: TextStyle(fontWeight: FontWeight.bold)),
        CheckboxListTile(
          title: const Text('Netbanking'),
          value: false,
          onChanged: (value) {},
        ),
        CheckboxListTile(
          title: const Text('EMI'),
          value: false,
          onChanged: (value) {},
        ),
        CheckboxListTile(
          title: const Text('Cash on Delivery'),
          value: false,
          onChanged: (value) {},
        ),
      ],
    ),
  );
}


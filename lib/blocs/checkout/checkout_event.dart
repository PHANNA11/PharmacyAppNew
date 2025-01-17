part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final Cart? cart;

  UpdateCheckout(
      {this.address,
      this.city,
      this.country,
      this.email,
      this.fullName,
      this.zipCode,
      this.cart});

  @override
  List<Object?> get props =>
      [fullName, email, city, country, zipCode, address, cart];
}

class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;
  const ConfirmCheckout({required this.checkout});

  @override
  List<Object?> get props => [checkout];
}

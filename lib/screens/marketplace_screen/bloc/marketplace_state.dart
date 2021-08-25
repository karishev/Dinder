part of 'marketplace_bloc.dart';

abstract class MarketplaceState extends Equatable {
  const MarketplaceState();
  
  @override
  List<Object> get props => [];
}

class MarketplaceInitial extends MarketplaceState {}

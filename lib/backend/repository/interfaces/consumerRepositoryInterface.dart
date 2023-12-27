import '../models/consumer.dart';

abstract class ConsumerRepositoryInterface {
  bool configured = false;

  void configure();
  Future<bool> createConsumer(String name, DateTime birthDate, String userUID);
  Future<Consumer?> getConsumerById(consumerId);
}

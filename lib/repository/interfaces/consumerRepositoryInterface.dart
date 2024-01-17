import 'package:uplace/models/consumer.dart';
import 'package:uplace/repository/interfaces/baseRepository.dart';

abstract class ConsumerRepositoryInterface extends BaseRepository {
  Future<bool> createConsumer(String name, DateTime birthDate, String userUID);
  Future<Consumer?> getConsumerById(consumerId);
}

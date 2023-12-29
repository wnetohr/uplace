import 'package:uplace/backend/repository/interfaces/baseRepository.dart';
import 'package:uplace/backend/repository/models/consumer.dart';

abstract class ConsumerRepositoryInterface extends BaseRepository {
  Future<bool> createConsumer(String name, DateTime birthDate, String userUID);
  Future<Consumer?> getConsumerById(consumerId);
}

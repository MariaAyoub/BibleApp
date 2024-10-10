import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/bible_repository.dart';
import '../../data/models/bible_verse.dart';

abstract class BibleState {}

class BibleInitial extends BibleState {}

class BibleLoading extends BibleState {}

class BibleLoaded extends BibleState {
  final List<BibleVerse> verses;
  BibleLoaded(this.verses);
}

class BibleError extends BibleState {
  final String error;
  BibleError(this.error);
}

class BibleCubit extends Cubit<BibleState> {
  final BibleRepository bibleRepository;

  BibleCubit(this.bibleRepository) : super(BibleInitial());

  void loadChapter(String book, int chapter) {
    emit(BibleLoading());
    bibleRepository.getBibleVerses(book, chapter).listen((verses) {
      emit(BibleLoaded(verses));
    }, onError: (e) {
      emit(BibleError(e.toString()));
    });
  }
}

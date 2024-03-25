import 'package:bloc/bloc.dart';

// Events
enum GameEvent { startGame, jump }

// States
class GameState {
  final double ballBottomPosition;
  final int score;
  final bool gameStarted;

  GameState({required this.ballBottomPosition, required this.score, required this.gameStarted});

  factory GameState.initial() {
    return GameState(ballBottomPosition: 0, score: 0, gameStarted: false);
  }

  GameState copyWith({double? ballBottomPosition, int? score, bool? gameStarted}) {
    return GameState(
      ballBottomPosition: ballBottomPosition ?? this.ballBottomPosition,
      score: score ?? this.score,
      gameStarted: gameStarted ?? this.gameStarted,
    );
  }
}

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.initial()) {
    on<GameEvent>((event, emit) {
      if (event == GameEvent.startGame) {
        emit(state.copyWith(gameStarted: true));
        double time = 0;
        Future<void> Function() loop = () async {
          while (state.gameStarted) {
            time += 0.05;
            double height = -4.9 * time * time + 2 * time;
            emit(state.copyWith(ballBottomPosition: height, score: state.score));
            await Future.delayed(Duration(milliseconds: 50));
          }
        };
        loop();
      } else if (event == GameEvent.jump) {
        emit(state.copyWith(ballBottomPosition: state.ballBottomPosition, score: state.score + 1));
      }
    });
  }
}

class UserInteractionBloc extends Bloc<GameEvent, GameState> {
  final GameBloc gameBloc;

  UserInteractionBloc({required this.gameBloc}) : super(GameState.initial()) {
    gameBloc.stream.listen((state) {
      if (state.gameStarted) {
        add(GameEvent.jump);
      }
    });
  }

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    yield* Stream.empty(); // This bloc doesn't handle events itself
  }
}

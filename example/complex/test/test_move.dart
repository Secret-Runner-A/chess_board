import 'package:bishop/bishop.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:squares_complex/game_extension.dart';

void main() {
  // final fen = '8/8/8/3n4/8/3P4/3Q4/8';
  final fen = '8/8/4r3/8/8/8/4P3/4K3 w - - 0 1';

  final game = Game(fen: fen);
  final List<Move> moves = [];
  for (int i = 0; i < game.board.length; i++) {
    Square target = game.board[i];
    // print("target: $target");
    if (target.isEmpty) continue;
    print("i: $i , target: $target");
    final pieceMoves = game.generatePieceMovesExtension(
      i,
      const MyMoveGenParams(
        captures: true,
        quiet: true,
        castling: true,
        legal: true,
        excludeQuietOnly: true,
        turnAgnosticLegalMoves: true,
        includeIllegalRoyalDefense: true,
        includeDefense: true,
        includeCaptureOnlyMove: true,
        ignorePieces: false,
      )
    );
    print(pieceMoves);
    moves.addAll(pieceMoves);
  }


  assert(moves.length == moves.toSet().length);

  print(moves.length);
}

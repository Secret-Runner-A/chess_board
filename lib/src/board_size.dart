import 'dart:math';

import 'package:squares/squares.dart';

/// Specifies the dimensions of a board.
class BoardSize {
  /// The horizontal size, i.e. number of files on the board.
  final int h;

  /// The vertical size, i.e. number of ranks on the board.
  final int v;

  /// The total number of squares on a board of this size.
  int get numSquares => h * v;

  /// Returns the shortest dimension.
  int get minDim => min(h, v);

  /// Returns the longest dimension.
  int get maxDim => max(h, v);

  /// Index of the last rank.
  int get maxRank => v - 1;

  /// Index of the last file.
  int get maxFile => h - 1;

  const BoardSize(this.h, this.v);

  /// A standard 8x8 board.
  factory BoardSize.standard() => BoardSize(8, 8);

  /// Returns a human-readable name for a square on a board of this size.
  /// e.g. c1, h6.
  String squareName(int square) {
    int rank = v - (square ~/ h);
    int file = square % h;
    String fileName = String.fromCharCode(ASCII_a + file);
    return '$fileName$rank';
  }

  /// Converts a human-readable square name into an integer, corresponding to
  /// the correct square on a board of this size.
  int squareNumber(String name) {
    name = name.toLowerCase();
    if (name == 'hand') return HAND;
    RegExp rx = RegExp(r'([A-Za-z])([0-9]+)');
    RegExpMatch? match = rx.firstMatch(name);
    assert(match != null, 'Invalid square name: $name');
    assert(match!.groupCount == 2, 'Invalid square name: $name');
    String file = match!.group(1)!;
    String rank = match.group(2)!;
    int _file = file.codeUnits[0] - ASCII_a;
    int _rank = v - int.parse(rank);
    int square = _rank * h + _file;
    return square;
  }

  /// Returns the rank that [square] is on.
  int squareRank(int square) => v - (square ~/ h);

  /// Returns the file that [square] is on.
  int squareFile(int square) => square % h;

  /// Calculates the difference in ranks between two squares.
  int rankDiff(int from, int to) => squareRank(to) - squareRank(from);

  /// Calculates the difference in files between two squares.
  int fileDiff(int from, int to) => squareFile(to) - squareFile(from);

  /// Create a `Move` from an algebraic string (e.g. a2a3, g6f3) for a board
  /// of this size.
  Move moveFromAlgebraic(String alg) {
    print(alg);
    if (alg[1] == '@') {
      // it's a drop
      int from = HAND;
      int to = squareNumber(alg.substring(2, 4));
      return Move(from: from, to: to, piece: alg[0].toUpperCase());
    }
    int from = squareNumber(alg.substring(0, 2));
    int to = squareNumber(alg.substring(2, 4));

    String? piece;
    int? gatingSquare;
    String? promo;
    List<String> _sections = alg.split('/');
    if (_sections.length > 1) {
      String _gate = _sections.last;
      piece = _gate[0];
      gatingSquare = _gate.length > 2 ? squareNumber(_gate.substring(1, 3)) : from;
    } else {
      promo = (alg.length > 4) ? alg[4] : null;
    }

    return Move(
      from: from,
      to: to,
      promo: promo,
      piece: piece,
      gatingSquare: gatingSquare,
    );
  }

  /// Returns an algebraic string (e.g. a2a3, g6f3), for a given [move].
  String moveToAlgebraic(Move move) {
    if (move.drop) {
      return '${move.piece!.toLowerCase()}@${squareName(move.to)}';
    } else {
      String from = squareName(move.from);
      String to = squareName(move.to);
      String alg = '$from$to';
      if (move.promotion) alg = '$alg${move.promo}';
      return alg;
    }
  }
}

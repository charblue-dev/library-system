import 'package:drift/drift.dart';
import 'package:drift/web.dart';
import 'package:library_system/database/tables/book.dart';
import 'package:library_system/database/tables/record.dart';

part 'library_database.g.dart';

@DriftDatabase(tables: [Books, Records])
class LibraryDatabase extends _$LibraryDatabase {
  LibraryDatabase() : super(WebDatabase('app')) {
    final books = _sampleBookList;
    for (final book in books) {
      setBook(book);
    }
  }

  @override
  int get schemaVersion => 1;

  Future<List<Book>> getBooks(int offset) {
    return (select(books)..limit(9, offset: offset)).get();
  }

  Future<List<Record>> getRecords() {
    return select(records).get();
  }

  Future<int> setBook(BooksCompanion book) {
    return into(books).insert(book);
  }

  Future<void> deleteBook(int id) {
    return (delete(books)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<Book>> search(String keyword) {
    return (select(books)..where((t) => t.title.like('%$keyword%'))).get();
  }

  Future<void> record(RecordsCompanion record) {
    return into(records).insert(record);
  }
}

List<BooksCompanion> get _sampleBookList {
  return [
    BooksCompanion.insert(
      title: '바보의 세계',
      author: '장프랑수아 마르미옹',
      publisher: '월북',
    ),
    BooksCompanion.insert(
      title: '이기적 유전자',
      author: '리처드 도킨스',
      publisher: '을유문화사',
    ),
    BooksCompanion.insert(
      title: '달러구트 꿈 백화점2',
      author: '이미예',
      publisher: '팩토리나인',
    ),
    BooksCompanion.insert(
      title: '에덴의 용',
      author: '칼 세이건',
      publisher: '사이언스북스',
    ),
    BooksCompanion.insert(
      title: '완전한 행복',
      author: '정유정',
      publisher: '은행나무',
    ),
    BooksCompanion.insert(
      title: '호흡의 기술',
      author: '제임스 네스터',
      publisher: '북트리거',
    ),
    BooksCompanion.insert(
      title: '이토록 뜻밖의 뇌과학',
      author: '리사 펠드먼 배럿',
      publisher: '더퀘스트',
    ),
    BooksCompanion.insert(
      title: '백광',
      author: '렌조 미키히코',
      publisher: '모모',
    ),
    BooksCompanion.insert(
      title: '괴담의 테이프',
      author: '미쓰다 신조',
      publisher: '북로드',
    ),
    BooksCompanion.insert(
      title: '베로니카, 죽기로 결심하다',
      author: '파울로 코엘료',
      publisher: '문학동네',
    ),
    BooksCompanion.insert(
      title: '죽음이란 무엇인가',
      author: '셀리 케이건',
      publisher: '엘도라도',
    ),
    BooksCompanion.insert(
      title: '슈뢰딩거의 아이들',
      author: '최의택',
      publisher: '아작',
    ),
    BooksCompanion.insert(
      title: '어서오세요, 휴남동서점입니다',
      author: '황보름',
      publisher: '클레이하우스',
    ),
    BooksCompanion.insert(
      title: '아홉병의 완벽한 타인들',
      author: '리안 모리아티',
      publisher: '마시멜로',
    ),
    BooksCompanion.insert(
      title: '불편한 편의점',
      author: '김호연',
      publisher: '나무옆의자',
    ),
  ];
}

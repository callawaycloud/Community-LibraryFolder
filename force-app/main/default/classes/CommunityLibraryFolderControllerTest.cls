@IsTest
private class CommunityLibraryFolderControllerTest {
  private static String libraryName = 'Test class library';

  @TestSetup
  private static void makeData() {
    // Create a library
    ContentWorkspace workspace = new ContentWorkspace(Name = libraryName);
    insert workspace;
  }

  @IsTest
  private static void getContentDocumentsOfContentWorkspace_noRecords() {
    List<ContentDocument> contentDocuments = CommunityLibraryFolderController.getContentDocumentsOfContentWorkspace(
      null
    );
    System.assertEquals(
      0,
      contentDocuments.size(),
      'Expected an empty ContentDocument list returned.'
    );
  }

  @IsTest
  private static void getContentDocumentsOfContentWorkspace_filesPresent() {
    Account testAccount = new Account(Name = 'Test account 1');
    insert testAccount;

    // Create a file
    ContentVersion contentVersionRecord = new ContentVersion(
      Title = 'Test',
      PathOnClient = 'Test.jpg',
      VersionData = Blob.valueOf('Test Content Data'),
      IsMajorVersion = true
    );
    insert contentVersionRecord;

    // Get details of the new file
    contentVersionRecord = [
      SELECT Id, Title, ContentDocumentId
      FROM ContentVersion
      WHERE Id = :contentVersionRecord.Id
      LIMIT 1
    ];
    List<ContentDocument> documents = [
      SELECT Id, Title, LatestPublishedVersionId
      FROM ContentDocument
    ];
    System.assertEquals(documents.size(), 1);

    // Add the file to the library
    Id libraryId = [SELECT Id FROM ContentWorkspace LIMIT 1].Id;
    ContentWorkspaceDoc workspaceDoc = new ContentWorkspaceDoc(
      ContentDocumentId = contentVersionRecord.ContentDocumentId,
      ContentWorkspaceId = libraryId
    );
    insert workspaceDoc;

    Test.startTest();
    List<ContentDocument> contentDocuments = CommunityLibraryFolderController.getContentDocumentsOfContentWorkspace(
      libraryName
    );
    Test.stopTest();
    System.assertEquals(
      1,
      contentDocuments.size(),
      'Expected a ContentDocument to be returned.'
    );
  }
}

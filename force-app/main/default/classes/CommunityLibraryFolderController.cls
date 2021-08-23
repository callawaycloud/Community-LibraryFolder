public with sharing class CommunityLibraryFolderController {
  @AuraEnabled(cacheable=true)
  public static List<ContentDocument> getContentDocumentsOfContentWorkspace(
    String contentWorkspaceName
  ) {
    List<ContentWorkspaceDoc> contentWorkspaceDocs = [
      SELECT Id, ContentDocumentId, ContentWorkspaceId
      FROM ContentWorkspaceDoc
      WHERE ContentWorkspace.Name = :contentWorkspaceName
      WITH SECURITY_ENFORCED
    ];

    Set<Id> contentDocumentIds = new Set<Id>();
    for (contentWorkspaceDoc cwd : contentWorkspaceDocs) {
      contentDocumentIds.add(cwd.ContentDocumentId);
    }

    List<ContentDocument> contentDocuments = [
      SELECT
        Id,
        Title,
        ContentSize,
        Description,
        FileExtension,
        FileType,
        LatestPublishedVersionId,
        ContentModifiedDate
      FROM ContentDocument
      WHERE Id IN :contentDocumentIds
      WITH SECURITY_ENFORCED
    ];

    return contentDocuments;
  }
}

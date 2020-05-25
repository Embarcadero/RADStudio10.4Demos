object CloudUIForm: TCloudUIForm
  Left = 0
  Top = 0
  Caption = 'Cloud API Test'
  ClientHeight = 623
  ClientWidth = 759
  Color = clBtnFace
  Constraints.MinHeight = 530
  Constraints.MinWidth = 540
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ServiceTabs: TPageControl
    Left = 0
    Top = 45
    Width = 759
    Height = 578
    ActivePage = Amazon
    Align = alClient
    TabOrder = 0
    object Azure: TTabSheet
      Caption = 'Azure'
      object AzureSTabs: TPageControl
        Left = 583
        Top = 0
        Width = 168
        Height = 550
        ActivePage = Blobs
        Align = alRight
        MultiLine = True
        TabOrder = 0
        object Tables: TTabSheet
          Caption = 'Tables'
          object azTableNameLabel: TLabel
            Left = 8
            Top = 48
            Width = 60
            Height = 13
            Caption = 'Table Name:'
          end
          object azGetTables: TButton
            Left = 8
            Top = 6
            Width = 143
            Height = 25
            Caption = 'Get Tables'
            TabOrder = 0
            OnClick = azGetTablesClick
          end
          object azDeleteRow: TButton
            Left = 8
            Top = 280
            Width = 143
            Height = 25
            Caption = 'Delete Row'
            TabOrder = 1
            OnClick = azDeleteRowClick
          end
          object azGetRows: TButton
            Left = 8
            Top = 156
            Width = 143
            Height = 25
            Caption = 'Get Rows'
            TabOrder = 2
            OnClick = azGetRowsClick
          end
          object azCreateRow: TButton
            Left = 8
            Top = 187
            Width = 143
            Height = 25
            Caption = 'Create Row'
            TabOrder = 3
            OnClick = azCreateRowClick
          end
          object azUpdateRow: TButton
            Left = 8
            Top = 218
            Width = 143
            Height = 25
            Caption = 'Update Row'
            TabOrder = 4
            OnClick = azUpdateRowClick
          end
          object azMergeRow: TButton
            Left = 8
            Top = 249
            Width = 143
            Height = 25
            Caption = 'Merge Row'
            TabOrder = 5
            OnClick = azMergeRowClick
          end
          object azCreateTable: TButton
            Left = 8
            Top = 94
            Width = 143
            Height = 25
            Caption = 'Create Table'
            TabOrder = 6
            OnClick = azCreateTableClick
          end
          object azDeleteTable: TButton
            Left = 8
            Top = 125
            Width = 143
            Height = 25
            Caption = 'Delete Table'
            TabOrder = 7
            OnClick = azDeleteTableClick
          end
          object azTableName: TEdit
            Left = 8
            Top = 67
            Width = 142
            Height = 21
            TabOrder = 8
            Text = 'testtable'
          end
        end
        object Queues: TTabSheet
          Caption = 'Queues'
          ImageIndex = 1
          object azQueueNameLabel: TLabel
            Left = 8
            Top = 48
            Width = 66
            Height = 13
            Caption = 'Queue Name:'
          end
          object azListQueues: TButton
            Left = 8
            Top = 6
            Width = 143
            Height = 25
            Caption = 'List Queues'
            TabOrder = 0
            OnClick = azListQueuesClick
          end
          object azCreateQueue: TButton
            Left = 8
            Top = 94
            Width = 143
            Height = 25
            Caption = 'Create Queue'
            TabOrder = 1
            OnClick = azCreateQueueClick
          end
          object azDeleteQueue: TButton
            Left = 8
            Top = 125
            Width = 143
            Height = 25
            Caption = 'Delete Queue'
            TabOrder = 2
            OnClick = azDeleteQueueClick
          end
          object azGetQueueMetadata: TButton
            Left = 8
            Top = 156
            Width = 143
            Height = 25
            Caption = 'Get Metadata'
            TabOrder = 3
            OnClick = azGetQueueMetadataClick
          end
          object azAddQueueMetadata: TButton
            Left = 8
            Top = 187
            Width = 143
            Height = 25
            Caption = 'Add Metadata'
            TabOrder = 4
            OnClick = azAddQueueMetadataClick
          end
          object azAddQueueMessage: TButton
            Left = 8
            Top = 218
            Width = 143
            Height = 25
            Caption = 'Add Message'
            TabOrder = 5
            OnClick = azAddQueueMessageClick
          end
          object azGetQueueMessages: TButton
            Left = 8
            Top = 249
            Width = 143
            Height = 25
            Caption = 'Get Messages'
            TabOrder = 6
            OnClick = azGetQueueMessagesClick
          end
          object azDeleteQueueMessages: TButton
            Left = 8
            Top = 311
            Width = 143
            Height = 25
            Caption = 'Delete Message'
            TabOrder = 7
            OnClick = azDeleteQueueMessagesClick
          end
          object azClearQueueMessages: TButton
            Left = 8
            Top = 342
            Width = 143
            Height = 25
            Caption = 'Clear Messages'
            TabOrder = 8
            OnClick = azClearQueueMessagesClick
          end
          object azQueueName: TEdit
            Left = 8
            Top = 67
            Width = 142
            Height = 21
            TabOrder = 9
            Text = 'testqueue'
          end
          object azPeekQueueMessages: TButton
            Left = 8
            Top = 280
            Width = 143
            Height = 25
            Caption = 'Peek Messages'
            TabOrder = 10
            OnClick = azPeekQueueMessagesClick
          end
        end
        object Blobs: TTabSheet
          Caption = 'Blobs'
          ImageIndex = 2
          object PageControl1: TPageControl
            Left = 0
            Top = 50
            Width = 160
            Height = 472
            ActivePage = BlobsSub
            Align = alClient
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            object Containers: TTabSheet
              Caption = 'Containers'
              object azListContainers: TButton
                Left = 8
                Top = 3
                Width = 134
                Height = 25
                Caption = 'List Containers'
                TabOrder = 0
                OnClick = azListContainersClick
              end
              object azCreateContainer: TButton
                Left = 8
                Top = 34
                Width = 134
                Height = 25
                Caption = 'Create Container'
                TabOrder = 1
                OnClick = azCreateContainerClick
              end
              object azDeleteContainer: TButton
                Left = 8
                Top = 65
                Width = 134
                Height = 25
                Caption = 'Delete Container'
                TabOrder = 2
                OnClick = azDeleteContainerClick
              end
              object azGetContainerProperties: TButton
                Left = 8
                Top = 96
                Width = 134
                Height = 25
                Caption = 'Get Container Properties'
                TabOrder = 3
                OnClick = azGetContainerPropertiesClick
              end
              object azSetContainerMetadata: TButton
                Left = 8
                Top = 127
                Width = 134
                Height = 25
                Caption = 'Set Container Metadata'
                TabOrder = 4
                OnClick = azSetContainerMetadataClick
              end
              object azGetContainerACL: TButton
                Left = 8
                Top = 220
                Width = 134
                Height = 25
                Caption = 'Get Container ACL'
                TabOrder = 5
                OnClick = azGetContainerACLClick
              end
              object azSetContainerACL: TButton
                Left = 8
                Top = 189
                Width = 134
                Height = 25
                Caption = 'Set Container ACL'
                TabOrder = 6
                OnClick = azSetContainerACLClick
              end
              object azGetContainerMetadata: TButton
                Left = 8
                Top = 158
                Width = 134
                Height = 25
                Caption = 'Get Container Metadata'
                TabOrder = 7
                OnClick = azGetContainerMetadataClick
              end
            end
            object BlobsSub: TTabSheet
              Caption = 'Blobs'
              ImageIndex = 1
              object azListBlobs: TButton
                Left = 8
                Top = 3
                Width = 134
                Height = 20
                Caption = 'List Blobs'
                TabOrder = 0
                OnClick = azListBlobsClick
              end
              object azPutBlobBlock: TButton
                Left = 8
                Top = 26
                Width = 134
                Height = 20
                Caption = 'Put Block Blob'
                TabOrder = 1
                OnClick = azPutBlobBlockClick
              end
              object azPutPageBlob: TButton
                Left = 8
                Top = 49
                Width = 134
                Height = 20
                Caption = 'Put Page Blob'
                TabOrder = 2
                OnClick = azPutPageBlobClick
              end
              object azLeaseBlob: TButton
                Left = 8
                Top = 72
                Width = 134
                Height = 20
                Caption = 'Lease Blob'
                TabOrder = 3
                OnClick = azLeaseBlobClick
              end
              object azGetBlobMetadata: TButton
                Left = 8
                Top = 118
                Width = 134
                Height = 20
                Caption = 'Get Blob Metadata'
                TabOrder = 4
                OnClick = azGetBlobMetadataClick
              end
              object azSetBlobMetadata: TButton
                Left = 8
                Top = 95
                Width = 134
                Height = 20
                Caption = 'Set Blob Metadata'
                TabOrder = 5
                OnClick = azSetBlobMetadataClick
              end
              object azGetBlobProperties: TButton
                Left = 8
                Top = 164
                Width = 134
                Height = 20
                Caption = 'Get Blob Properties'
                TabOrder = 6
                OnClick = azGetBlobPropertiesClick
              end
              object azSetBlobProperties: TButton
                Left = 8
                Top = 141
                Width = 134
                Height = 20
                Caption = 'Set Blob Properties'
                TabOrder = 7
                OnClick = azSetBlobPropertiesClick
              end
              object azDeleteBlob: TButton
                Left = 8
                Top = 187
                Width = 134
                Height = 20
                Caption = 'Delete Blob'
                TabOrder = 8
                OnClick = azDeleteBlobClick
              end
              object azDownloadBlob: TButton
                Left = 8
                Top = 210
                Width = 134
                Height = 20
                Caption = 'Download Blob'
                TabOrder = 9
                OnClick = azDownloadBlobClick
              end
              object azCopyBlob: TButton
                Left = 8
                Top = 233
                Width = 134
                Height = 20
                Caption = 'Copy Blob'
                TabOrder = 10
                OnClick = azCopyBlobClick
              end
              object azSnapshotBlob: TButton
                Left = 8
                Top = 256
                Width = 134
                Height = 20
                Caption = 'Snapshot Blob'
                TabOrder = 11
                OnClick = azSnapshotBlobClick
              end
              object azUploadBlock: TButton
                Left = 8
                Top = 279
                Width = 134
                Height = 20
                Caption = 'Upload Block'
                TabOrder = 12
                OnClick = azUploadBlockClick
              end
              object azUploadPage: TButton
                Left = 8
                Top = 302
                Width = 134
                Height = 20
                Caption = 'Upload Page'
                TabOrder = 13
                OnClick = azUploadPageClick
              end
              object azGetBlockList: TButton
                Left = 8
                Top = 325
                Width = 134
                Height = 20
                Caption = 'Get Block List'
                TabOrder = 14
                OnClick = azGetBlockListClick
              end
              object azPubBlockList: TButton
                Left = 8
                Top = 348
                Width = 134
                Height = 20
                Caption = 'Put Block List'
                TabOrder = 15
                OnClick = azPubBlockListClick
              end
              object azGetPageRegions: TButton
                Left = 8
                Top = 371
                Width = 134
                Height = 20
                Caption = 'Get Page Regions'
                TabOrder = 16
                OnClick = azGetPageRegionsClick
              end
            end
          end
          object blobspanel: TPanel
            Left = 0
            Top = 0
            Width = 160
            Height = 50
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            Ctl3D = True
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 1
            object azContainerNameLabel: TLabel
              Left = 10
              Top = 5
              Width = 81
              Height = 13
              Caption = 'Container Name:'
            end
            object azContainerName: TEdit
              Left = 10
              Top = 24
              Width = 134
              Height = 21
              TabOrder = 0
              Text = 'testcontainer'
            end
          end
        end
      end
      object AzureOutputMemo: TMemo
        Left = 0
        Top = 0
        Width = 583
        Height = 550
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object Amazon: TTabSheet
      Caption = 'Amazon'
      ImageIndex = 1
      object AmazonSTabs: TPageControl
        Left = 583
        Top = 0
        Width = 168
        Height = 550
        ActivePage = amQueues
        Align = alRight
        TabOrder = 0
        object amTables: TTabSheet
          Caption = 'Tables'
          object amTableNameLabel: TLabel
            Left = 8
            Top = 48
            Width = 60
            Height = 13
            Caption = 'Table Name:'
          end
          object amBatchCreateRows: TButton
            Left = 8
            Top = 280
            Width = 143
            Height = 25
            Caption = 'Batch Create Rows'
            TabOrder = 0
            OnClick = amBatchCreateRowsClick
          end
          object amDeleteRow: TButton
            Left = 8
            Top = 342
            Width = 143
            Height = 25
            Caption = 'Delete Row'
            TabOrder = 1
            OnClick = amDeleteRowClick
          end
          object amDeleteColumn: TButton
            Left = 8
            Top = 311
            Width = 143
            Height = 25
            Caption = 'Delete Column'
            TabOrder = 2
            OnClick = amDeleteColumnClick
          end
          object amCreateTable: TButton
            Left = 8
            Top = 94
            Width = 143
            Height = 25
            Caption = 'Create Table'
            TabOrder = 3
            OnClick = amCreateTableClick
          end
          object amCreateRow: TButton
            Left = 8
            Top = 249
            Width = 143
            Height = 25
            Caption = 'Create Row'
            TabOrder = 4
            OnClick = amCreateRowClick
          end
          object amDeleteTable: TButton
            Left = 8
            Top = 125
            Width = 143
            Height = 25
            Caption = 'Delete Table'
            TabOrder = 5
            OnClick = amDeleteTableClick
          end
          object amGetRows: TButton
            Left = 8
            Top = 187
            Width = 143
            Height = 25
            Caption = 'Get Rows'
            TabOrder = 6
            OnClick = amGetRowsClick
          end
          object amGetTableMetadata: TButton
            Left = 8
            Top = 156
            Width = 143
            Height = 25
            Caption = 'Get Table Metadata'
            TabOrder = 7
            OnClick = amGetTableMetadataClick
          end
          object amGetTables: TButton
            Left = 8
            Top = 6
            Width = 143
            Height = 25
            BiDiMode = bdLeftToRight
            Caption = 'Get Tables'
            ParentBiDiMode = False
            TabOrder = 8
            OnClick = amGetTablesClick
          end
          object amTableName: TEdit
            Left = 8
            Top = 67
            Width = 142
            Height = 21
            TabOrder = 9
            Text = 'testtable'
          end
          object amGetRowsID: TButton
            Left = 8
            Top = 218
            Width = 143
            Height = 25
            Caption = 'Get Rows ID'
            TabOrder = 10
            OnClick = amGetRowsIDClick
          end
        end
        object amQueues: TTabSheet
          Caption = 'Queues'
          ImageIndex = 1
          object amQueueNameLabel: TLabel
            Left = 8
            Top = 48
            Width = 66
            Height = 13
            Caption = 'Queue Name:'
          end
          object amListQueues: TButton
            Left = 8
            Top = 6
            Width = 143
            Height = 25
            Caption = 'List Queues'
            TabOrder = 0
            OnClick = amListQueuesClick
          end
          object amCreateQueue: TButton
            Left = 8
            Top = 94
            Width = 143
            Height = 25
            Caption = 'Create Queue'
            TabOrder = 1
            OnClick = amCreateQueueClick
          end
          object amDeleteQueue: TButton
            Left = 8
            Top = 125
            Width = 143
            Height = 25
            Caption = 'Delete Queue'
            TabOrder = 2
            OnClick = amDeleteQueueClick
          end
          object amGetQueueProperties: TButton
            Left = 8
            Top = 156
            Width = 143
            Height = 25
            Caption = 'Get Properties'
            TabOrder = 3
            OnClick = amGetQueuePropertiesClick
          end
          object amSetQueueProperties: TButton
            Left = 8
            Top = 187
            Width = 143
            Height = 25
            Caption = 'Set Property'
            TabOrder = 4
            OnClick = amSetQueuePropertiesClick
          end
          object amAddQueuePermissions: TButton
            Left = 8
            Top = 218
            Width = 143
            Height = 25
            Caption = 'Add Permissions'
            TabOrder = 5
            OnClick = amAddQueuePermissionsClick
          end
          object amDeleteQueuePermissions: TButton
            Left = 8
            Top = 249
            Width = 143
            Height = 25
            Caption = 'Remove Permissions'
            TabOrder = 6
            OnClick = amDeleteQueuePermissionsClick
          end
          object amAddQueueMessage: TButton
            Left = 8
            Top = 280
            Width = 143
            Height = 25
            Caption = 'Add Message'
            TabOrder = 7
            OnClick = amAddQueueMessageClick
          end
          object amGetMessages: TButton
            Left = 8
            Top = 311
            Width = 143
            Height = 25
            Caption = 'Get Messages'
            TabOrder = 8
            OnClick = amGetMessagesClick
          end
          object amDeleteMessage: TButton
            Left = 8
            Top = 373
            Width = 143
            Height = 25
            Caption = 'Delete Message'
            TabOrder = 9
            OnClick = amDeleteMessageClick
          end
          object amChangeMessageVisibility: TButton
            Left = 8
            Top = 404
            Width = 143
            Height = 25
            Caption = 'Change Message Visibility'
            TabOrder = 10
            OnClick = amChangeMessageVisibilityClick
          end
          object amQueueName: TEdit
            Left = 8
            Top = 67
            Width = 142
            Height = 21
            TabOrder = 11
            Text = 'testqueue'
          end
          object amPeekMessages: TButton
            Left = 8
            Top = 342
            Width = 143
            Height = 25
            Caption = 'Peek Messages'
            TabOrder = 12
            OnClick = amPeekMessagesClick
          end
          object amSendMessageBatch: TButton
            Left = 8
            Top = 434
            Width = 143
            Height = 25
            Caption = 'Send Message Batch'
            TabOrder = 13
            OnClick = amSendMessageBatchClick
          end
          object amChangeMessageVisibilityBatch: TButton
            Left = 8
            Top = 464
            Width = 143
            Height = 25
            Caption = 'Change Visibility Batch'
            TabOrder = 14
            OnClick = amChangeMessageVisibilityBatchClick
          end
          object amDeleteMessageBatch: TButton
            Left = 8
            Top = 494
            Width = 143
            Height = 25
            Caption = 'Delete Message Batch'
            TabOrder = 15
            OnClick = amDeleteMessageBatchClick
          end
        end
        object AmBlobs: TTabSheet
          Caption = 'Blobs'
          ImageIndex = 2
          object AmazonBlobTab: TPageControl
            Left = 0
            Top = 50
            Width = 160
            Height = 472
            ActivePage = ObjectTab
            Align = alClient
            TabOrder = 0
            object BucketTab: TTabSheet
              Caption = 'Bucket'
              object amListBuckets: TButton
                Left = 8
                Top = 3
                Width = 134
                Height = 20
                Caption = 'List Buckets'
                TabOrder = 0
                OnClick = amListBucketsClick
              end
              object amCreateBucket: TButton
                Left = 8
                Top = 26
                Width = 134
                Height = 20
                Caption = 'Create Bucket'
                TabOrder = 1
                OnClick = amCreateBucketClick
              end
              object amDeleteBucket: TButton
                Left = 8
                Top = 49
                Width = 134
                Height = 20
                Caption = 'Delete Bucket'
                TabOrder = 2
                OnClick = amDeleteBucketClick
              end
              object amGetBucket: TButton
                Left = 8
                Top = 72
                Width = 134
                Height = 20
                Caption = 'Get Bucket'
                TabOrder = 3
                OnClick = amGetBucketClick
              end
              object amSetBucketPolicy: TButton
                Left = 8
                Top = 118
                Width = 134
                Height = 20
                Caption = 'Set Bucket Policy'
                TabOrder = 4
                OnClick = amSetBucketPolicyClick
              end
              object amGetBucketPolicy: TButton
                Left = 8
                Top = 141
                Width = 134
                Height = 20
                Caption = 'Get Bucket Policy'
                TabOrder = 5
                OnClick = amGetBucketPolicyClick
              end
              object amDeleteBucketPolicy: TButton
                Left = 8
                Top = 164
                Width = 134
                Height = 20
                Caption = 'Delete Bucket Policy'
                TabOrder = 6
                OnClick = amDeleteBucketPolicyClick
              end
              object amGetBucketVersionInfo: TButton
                Left = 8
                Top = 95
                Width = 134
                Height = 20
                Caption = 'Get Bucket Version Info'
                TabOrder = 7
                OnClick = amGetBucketVersionInfoClick
              end
              object amSetBucketACL: TButton
                Left = 8
                Top = 187
                Width = 134
                Height = 20
                Caption = 'Set Bucket ACL'
                TabOrder = 8
                OnClick = amSetBucketACLClick
              end
              object amGetBucketACL: TButton
                Left = 8
                Top = 210
                Width = 134
                Height = 20
                Caption = 'Get Bucket ACL'
                TabOrder = 9
                OnClick = amGetBucketACLClick
              end
              object amSetBucketLogging: TButton
                Left = 8
                Top = 233
                Width = 134
                Height = 20
                Caption = 'Set Bucket Logging'
                TabOrder = 10
                OnClick = amSetBucketLoggingClick
              end
              object amGetBucketLogging: TButton
                Left = 8
                Top = 256
                Width = 134
                Height = 20
                Caption = 'Get Bucket Logging'
                TabOrder = 11
                OnClick = amGetBucketLoggingClick
              end
              object amSetBucketNotification: TButton
                Left = 8
                Top = 279
                Width = 134
                Height = 20
                Caption = 'Set Bucket Notification'
                TabOrder = 12
                OnClick = amSetBucketNotificationClick
              end
              object amGetBucketNotification: TButton
                Left = 8
                Top = 302
                Width = 134
                Height = 20
                Caption = 'Get Bucket Notification'
                TabOrder = 13
                OnClick = amGetBucketNotificationClick
              end
              object amGetBucketPayer: TButton
                Left = 8
                Top = 348
                Width = 134
                Height = 20
                Caption = 'Get Bucket Payer'
                TabOrder = 14
                OnClick = amGetBucketPayerClick
              end
              object amSetBucketPayer: TButton
                Left = 8
                Top = 325
                Width = 134
                Height = 20
                Caption = 'Set Bucker Payer'
                TabOrder = 15
                OnClick = amSetBucketPayerClick
              end
              object amGetBucketVersioning: TButton
                Left = 8
                Top = 396
                Width = 134
                Height = 20
                Caption = 'Get Bucket Versioning'
                TabOrder = 16
                OnClick = amGetBucketVersioningClick
              end
              object amSetBucketVersioning: TButton
                Left = 8
                Top = 372
                Width = 134
                Height = 20
                Caption = 'Set Bucket Versioning'
                TabOrder = 17
                OnClick = amSetBucketVersioningClick
              end
              object amGetBucketLocation: TButton
                Left = 8
                Top = 420
                Width = 134
                Height = 20
                Caption = 'Get Bucket Location'
                TabOrder = 18
                OnClick = amGetBucketLocationClick
              end
            end
            object ObjectTab: TTabSheet
              Caption = 'Object'
              ImageIndex = 1
              object amDeleteObject: TButton
                Left = 8
                Top = 34
                Width = 135
                Height = 25
                Caption = 'Delete Object'
                TabOrder = 0
                OnClick = amDeleteObjectClick
              end
              object amGetObjectACL: TButton
                Left = 8
                Top = 127
                Width = 135
                Height = 25
                Caption = 'Get Object ACL'
                TabOrder = 1
                OnClick = amGetObjectACLClick
              end
              object amUploadObject: TButton
                Left = 8
                Top = 3
                Width = 135
                Height = 25
                Caption = 'Upload Object'
                TabOrder = 2
                OnClick = amUploadObjectClick
              end
              object amButtObjCopy: TButton
                Left = 8
                Top = 251
                Width = 135
                Height = 25
                Caption = 'Copy Object'
                TabOrder = 3
                OnClick = amButtObjCopyClick
              end
              object amUploadPart: TButton
                Left = 8
                Top = 313
                Width = 135
                Height = 25
                Caption = 'Upload Part'
                TabOrder = 4
                OnClick = amUploadPartClick
              end
              object amAbortMultipartUpload: TButton
                Left = 8
                Top = 344
                Width = 135
                Height = 25
                Caption = 'Abort Multipart Upload'
                TabOrder = 5
                OnClick = amAbortMultipartUploadClick
              end
              object amListParts: TButton
                Left = 8
                Top = 407
                Width = 135
                Height = 25
                Caption = 'List Parts'
                TabOrder = 6
                OnClick = amListPartsClick
              end
              object amInitiateMultipartUpload: TButton
                Left = 8
                Top = 282
                Width = 135
                Height = 25
                Caption = 'Init Multipart Upload'
                TabOrder = 7
                OnClick = amInitiateMultipartUploadClick
              end
              object amPutObjectACL: TButton
                Left = 8
                Top = 96
                Width = 135
                Height = 25
                Caption = 'Set Object ACL'
                TabOrder = 8
                OnClick = amPutObjectACLClick
              end
              object amGetObjectMetadata: TButton
                Left = 8
                Top = 220
                Width = 135
                Height = 25
                Caption = 'Get Object Metadata'
                TabOrder = 9
                OnClick = amGetObjectMetadataClick
              end
              object amGetObjectTorrent: TButton
                Left = 8
                Top = 158
                Width = 135
                Height = 25
                Caption = 'Get Object Torrent'
                TabOrder = 10
                OnClick = amGetObjectTorrentClick
              end
              object amGetObject: TButton
                Left = 8
                Top = 65
                Width = 135
                Height = 25
                Caption = 'Get Object'
                TabOrder = 11
                OnClick = amGetObjectClick
              end
              object amSetObjectMetadata: TButton
                Left = 8
                Top = 189
                Width = 135
                Height = 25
                Caption = 'Set Object Metadata'
                TabOrder = 12
                OnClick = amSetObjectMetadataClick
              end
              object amCompleteMultipartUpload: TButton
                Left = 8
                Top = 375
                Width = 135
                Height = 25
                Caption = 'Complete Multipart Upload'
                TabOrder = 13
                OnClick = amCompleteMultipartUploadClick
              end
            end
          end
          object amBucketNamePanel: TPanel
            Left = 0
            Top = 0
            Width = 160
            Height = 50
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            Ctl3D = True
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 1
            object amBucketNameLabel: TLabel
              Left = 10
              Top = 5
              Width = 66
              Height = 13
              Caption = 'Bucket Name:'
            end
            object amBucketName: TEdit
              Left = 10
              Top = 24
              Width = 134
              Height = 21
              TabOrder = 0
              Text = 'testbucket'
            end
            object amGenerateBucketName: TButton
              Left = 88
              Top = 3
              Width = 57
              Height = 20
              Caption = 'Generate'
              TabOrder = 1
              OnClick = amGenerateBucketNameClick
            end
          end
        end
      end
      object AmazonOutputMemo: TMemo
        Left = 0
        Top = 0
        Width = 583
        Height = 550
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object AccountsPage: TTabSheet
      Caption = 'Accounts'
      ImageIndex = 2
      object AccountsListBox: TListBox
        Left = 0
        Top = 0
        Width = 751
        Height = 408
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
      end
      object NewAccountPanel: TPanel
        Left = 0
        Top = 408
        Width = 751
        Height = 142
        Align = alBottom
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        DesignSize = (
          751
          142)
        object Label1: TLabel
          Left = 8
          Top = 58
          Width = 67
          Height = 13
          Caption = 'Display name:'
        end
        object Label2: TLabel
          Left = 4
          Top = 6
          Width = 79
          Height = 13
          Caption = 'NEW ACCOUNT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 3
          Top = 85
          Width = 72
          Height = 13
          Caption = 'Account name:'
        end
        object Label4: TLabel
          Left = 12
          Top = 113
          Width = 63
          Height = 13
          Caption = 'Account key:'
        end
        object Label5: TLabel
          Left = 8
          Top = 31
          Width = 28
          Height = 13
          Caption = 'Type:'
        end
        object UserIDLabel: TLabel
          Left = 184
          Top = 31
          Width = 40
          Height = 13
          Caption = 'User ID:'
          Visible = False
        end
        object UserNameLabel: TLabel
          Left = 432
          Top = 31
          Width = 56
          Height = 13
          Caption = 'User Name:'
          Visible = False
        end
        object UserPrincipalLabel: TLabel
          Left = 584
          Top = 31
          Width = 68
          Height = 13
          Caption = 'User Principal:'
          Visible = False
        end
        object NewAccDisplayName: TEdit
          Left = 78
          Top = 55
          Width = 528
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnChange = NewAccFieldChanged
        end
        object NewAccName: TEdit
          Left = 78
          Top = 82
          Width = 528
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          OnChange = NewAccFieldChanged
        end
        object NewAccKey: TEdit
          Left = 78
          Top = 109
          Width = 528
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          PasswordChar = '*'
          TabOrder = 2
          OnChange = NewAccFieldChanged
        end
        object NewaccAddButton: TButton
          Left = 669
          Top = 80
          Width = 73
          Height = 50
          Anchors = [akRight, akBottom]
          Caption = 'Add Account'
          Enabled = False
          TabOrder = 3
          OnClick = NewaccAddButtonClick
        end
        object ShowKeyCheck: TCheckBox
          Left = 612
          Top = 111
          Width = 44
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = 'Show'
          TabOrder = 4
          OnClick = ShowKeyCheckClick
        end
        object NewAccType: TComboBox
          Left = 78
          Top = 28
          Width = 100
          Height = 21
          TabOrder = 5
          Text = 'Azure'
          OnChange = NewAccFieldChanged
          Items.Strings = (
            'Azure'
            'Amazon')
        end
        object UserID: TEdit
          Left = 230
          Top = 28
          Width = 195
          Height = 21
          TabOrder = 6
          Visible = False
          OnChange = NewAccFieldChanged
        end
        object UserName: TEdit
          Left = 494
          Top = 28
          Width = 83
          Height = 21
          TabOrder = 7
          Visible = False
          OnChange = NewAccFieldChanged
        end
        object UserPrincipal: TEdit
          Left = 658
          Top = 28
          Width = 83
          Height = 21
          TabOrder = 8
          Visible = False
          OnChange = NewAccFieldChanged
        end
      end
    end
  end
  object AzureConnPanel: TPanel
    Left = 0
    Top = 0
    Width = 759
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    StyleElements = [seFont, seClient]
    DesignSize = (
      759
      45)
    object lbCloud: TLabel
      Left = 8
      Top = 14
      Width = 31
      Height = 13
      Caption = 'Cloud:'
    end
    object cbConnection: TComboBox
      Left = 45
      Top = 11
      Width = 704
      Height = 21
      AutoDropDown = True
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      TextHint = 'Choose a Connection...'
      OnChange = cbConnectionChange
    end
  end
end

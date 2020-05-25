object MergeMainController: TMergeMainController
  OldCreateOrder = False
  Height = 217
  Width = 328
  object ActionList: TActionList
    Left = 136
    Top = 64
    object actMerge: TAction
      Caption = 'Merge'
      OnExecute = actMergeExecute
    end
    object actGetIBFileName: TAction
      Caption = '...'
      OnExecute = actGetIBFileNameExecute
    end
  end
end

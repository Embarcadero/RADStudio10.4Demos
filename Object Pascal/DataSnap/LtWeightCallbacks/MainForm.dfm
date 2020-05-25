object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Reverse Strings Client'
  ClientHeight = 553
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    780
    553)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 523
    Top = 8
    Width = 49
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Stop after'
    ExplicitLeft = 415
  end
  object Memo1: TMemo
    Left = 9
    Top = 8
    Width = 508
    Height = 537
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '  Once upon a midnight dreary, while I pondered weak and weary,'
      'Over many a quaint and curious volume of forgotten lore,'
      'While I nodded, nearly napping, suddenly there came a tapping,'
      'As of some one gently rapping, rapping at my chamber door.'
      '`'#39'Tis some visitor,'#39' I muttered, `tapping at my chamber door -'
      'Only this, and nothing more.'#39
      ''
      'Ah, distinctly I remember it was in the bleak December,'
      'And each separate dying ember wrought its ghost upon the floor.'
      'Eagerly I wished the morrow; - vainly I had sought to borrow'
      'From my books surcease of sorrow - sorrow for the lost Lenore -'
      'For the rare and radiant maiden whom the angels named Lenore -'
      'Nameless here for evermore.'
      ''
      'And the silken sad uncertain rustling of each purple curtain'
      
        'Thrilled me - filled me with fantastic terrors never felt before' +
        ';'
      'So that now, to still the beating of my heart, I stood repeating'
      '`'#39'Tis some visitor entreating entrance at my chamber door -'
      'Some late visitor entreating entrance at my chamber door; -'
      'This it is, and nothing more,'#39
      ''
      'Presently my soul grew stronger; hesitating then no longer,'
      '`Sir,'#39' said I, `or Madam, truly your forgiveness I implore;'
      'But the fact is I was napping, and so gently you came rapping,'
      'And so faintly you came tapping, tapping at my chamber door,'
      
        'That I scarce was sure I heard you'#39' - here I opened wide the doo' +
        'r; -'
      'Darkness there, and nothing more.'
      ''
      
        'Deep into that darkness peering, long I stood there wondering, f' +
        'earing,'
      'Doubting, dreaming dreams no mortal ever dared to dream before'
      'But the silence was unbroken, and the darkness gave no token,'
      'And the only word there spoken was the whispered word, `Lenore!'#39
      'This I whispered, and an echo murmured back the word, `Lenore!'#39
      'Merely this and nothing more.'
      ''
      'Back into the chamber turning, all my soul within me burning,'
      'Soon again I heard a tapping somewhat louder than before.'
      
        '`Surely,'#39' said I, `surely that is something at my window lattice' +
        ';'
      'Let me see then, what thereat is, and this mystery explore -'
      'Let my heart be still a moment and this mystery explore; -'
      #39'Tis the wind and nothing more!'#39
      ''
      
        'Open here I flung the shutter, when, with many a flirt and flutt' +
        'er,'
      'In there stepped a stately raven of the saintly days of yore.'
      
        'Not the least obeisance made he; not a minute stopped or stayed ' +
        'he;'
      'But, with mien of lord or lady, perched above my chamber door -'
      'Perched upon a bust of Pallas just above my chamber door -'
      'Perched, and sat, and nothing more.'
      ''
      'Then this ebony bird beguiling my sad fancy into smiling,'
      'By the grave and stern decorum of the countenance it wore,'
      
        '`Though thy crest be shorn and shaven, thou,'#39' I said, `art sure ' +
        'no craven.'
      
        'Ghastly grim and ancient raven wandering from the nightly shore ' +
        '-'
      'Tell me what thy lordly name is on the Night'#39's Plutonian shore!'#39
      'Quoth the raven, `Nevermore.'#39
      ''
      
        'Much I marvelled this ungainly fowl to hear discourse so plainly' +
        ','
      'Though its answer little meaning - little relevancy bore;'
      'For we cannot help agreeing that no living human being'
      'Ever yet was blessed with seeing bird above his chamber door -'
      'Bird or beast above the sculptured bust above his chamber door,'
      'With such name as `Nevermore.'#39
      ''
      'But the raven, sitting lonely on the placid bust, spoke only,'
      'That one word, as if his soul in that one word he did outpour.'
      
        'Nothing further then he uttered - not a feather then he fluttere' +
        'd -'
      
        'Till I scarcely more than muttered `Other friends have flown bef' +
        'ore -'
      'On the morrow he will leave me, as my hopes have flown before.'#39
      'Then the bird said, `Nevermore.'#39
      ''
      'Startled at the stillness broken by reply so aptly spoken,'
      
        '`Doubtless,'#39' said I, `what it utters is its only stock and store' +
        ','
      'Caught from some unhappy master whom unmerciful disaster'
      
        'Followed fast and followed faster till his songs one burden bore' +
        ' -'
      'Till the dirges of his hope that melancholy burden bore'
      'Of "Never-nevermore."'#39
      ''
      'But the raven still beguiling all my sad soul into smiling,'
      
        'Straight I wheeled a cushioned seat in front of bird and bust an' +
        'd door;'
      'Then, upon the velvet sinking, I betook myself to linking'
      'Fancy unto fancy, thinking what this ominous bird of yore -'
      
        'What this grim, ungainly, ghastly, gaunt, and ominous bird of yo' +
        're'
      'Meant in croaking `Nevermore.'#39
      ''
      'This I sat engaged in guessing, but no syllable expressing'
      'To the fowl whose fiery eyes now burned into my bosom'#39's core;'
      'This and more I sat divining, with my head at ease reclining'
      'On the cushion'#39's velvet lining that the lamp-light gloated o'#39'er,'
      
        'But whose velvet violet lining with the lamp-light gloating o'#39'er' +
        ','
      'She shall press, ah, nevermore!'
      ''
      
        'Then, methought, the air grew denser, perfumed from an unseen ce' +
        'nser'
      'Swung by Seraphim whose foot-falls tinkled on the tufted floor.'
      
        '`Wretch,'#39' I cried, `thy God hath lent thee - by these angels he ' +
        'has sent thee'
      'Respite - respite and nepenthe from thy memories of Lenore!'
      
        'Quaff, oh quaff this kind nepenthe, and forget this lost Lenore!' +
        #39
      'Quoth the raven, `Nevermore.'#39
      ''
      
        '`Prophet!'#39' said I, `thing of evil! - prophet still, if bird or d' +
        'evil! -'
      
        'Whether tempter sent, or whether tempest tossed thee here ashore' +
        ','
      'Desolate yet all undaunted, on this desert land enchanted -'
      'On this home by horror haunted - tell me truly, I implore -'
      
        'Is there - is there balm in Gilead? - tell me - tell me, I implo' +
        're!'#39
      'Quoth the raven, `Nevermore.'#39
      ''
      
        '`Prophet!'#39' said I, `thing of evil! - prophet still, if bird or d' +
        'evil!'
      'By that Heaven that bends above us - by that God we both adore -'
      'Tell this soul with sorrow laden if, within the distant Aidenn,'
      'It shall clasp a sainted maiden whom the angels named Lenore -'
      'Clasp a rare and radiant maiden, whom the angels named Lenore?'#39
      'Quoth the raven, `Nevermore.'#39
      ''
      
        '`Be that word our sign of parting, bird or fiend!'#39' I shrieked up' +
        'starting -'
      '`Get thee back into the tempest and the Night'#39's Plutonian shore!'
      
        'Leave no black plume as a token of that lie thy soul hath spoken' +
        '!'
      'Leave my loneliness unbroken! - quit the bust above my door!'
      
        'Take thy beak from out my heart, and take thy form from off my d' +
        'oor!'#39
      'Quoth the raven, `Nevermore.'#39
      ''
      
        'And the raven, never flitting, still is sitting, still is sittin' +
        'g'
      'On the pallid bust of Pallas just above my chamber door;'
      'And his eyes have all the seeming of a demon'#39's that is dreaming,'
      
        'And the lamp-light o'#39'er him streaming throws his shadow on the f' +
        'loor;'
      'And my soul from out that shadow that lies floating on the floor'
      'Shall be lifted - nevermore!'
      '')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    WordWrap = False
  end
  object Button1: TButton
    Left = 523
    Top = 32
    Width = 122
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Reverse Strings'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 578
    Top = 5
    Width = 67
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 2
    Text = '10000'
  end
  object ListBox1: TListBox
    Left = 523
    Top = 66
    Width = 249
    Height = 479
    Anchors = [akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 3
  end
  object DsConnection: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DbxDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=16.0.0.0,Culture=neutral,PublicKey' +
        'Token=a91a7c5705831a4f')
    Left = 666
    Top = 18
    UniqueId = '{DFEE23CD-B37C-4BBF-8892-B5EFEB030403}'
  end
end

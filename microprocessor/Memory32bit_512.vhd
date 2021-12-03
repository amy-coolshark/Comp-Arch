library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Memory512x32 is
  port ( address_mem : in STD_LOGIC_VECTOR(31 downto 0);
         write_data : in STD_LOGIC_VECTOR(31 downto 0);
         mem_write : in STD_LOGIC;
         read_data : out STD_LOGIC_VECTOR(31 downto 0)
  );
end Memory512x32;

architecture Behavioral of Memory512x32 is
  type mem_array is array(0 to 511) of STD_LOGIC_VECTOR(31 downto 0);
  signal Memory512x32 : mem_array := (
    "00000000000000011000000000000000", -- load reg0 with 0
    "00000000000000001000100000000000", -- increment reg0 and store in reg2
    "00000000000000000000000001000111", -- add 7 to reg2 and store in reg0
    "00000000000000111001100000000000", -- reg6 = not reg6
    "00000000000000000000000000000000", -- 4
    "00000000000000000000000000000000", --5
    "00000000000000000000000000000000", --6
    "00000000000000000000000000000000", --7
    "00000000000000000000000000000000", --8
    "00000000000000000000000000000000", --9
    "00000000000000000000000000000000", --10
    "00000000000000000000000000000000", --11
    "00000000000000000000000000000000", --12
    "00000000000000000000000000000000", --13
    "00000000000000000000000000000000", --14
    "00000000000000000000000000000000", --15
    "00000000000000000000000000000000", --16
    "00000000000000000000000000000000", --17
    "00000000000000000000000000000000", --18
    "00000000000000000000000000000000", --19
    "00000000000000000000000000000000", --20
    "00000000000000000000000000000000", --21
    "00000000000000000000000000000000", --22
    "00000000000000000000000000000000", --23
    "00000000000000000000000000000000", --24
    "00000000000000000000000000000000", --25
    "00000000000000000000000000000000", --26
    "00000000000000000000000000000000", --27
    "00000000000000000000000000000000", --28
    "00000000000000000000000000000000", --29
    "00000000000000000000000000000000", --30
    "00000000000000000000000000000000", --31
    "00000000000000000000000000000000", --32
    "00000000000000000000000000000000", --33
    "00000000000000000000000000000000", --34
    "00000000000000000000000000000000", --35
    "00000000000000000000000000000000", --36
    "00000000000000000000000000000000", --37
    "00000000000000000000000000000000", --38
    "00000000000000000000000000000000", --39
    "00000000000000000000000000000000", --40
    "00000000000000000000000000000000", --41
    "00000000000000000000000000000000", --42
    "00000000000000000000000000000000", --43
    "00000000000000000000000000000000", --44
    "00000000000000000000000000000000", --45
    "00000000000000000000000000000000", --46
    "00000000000000000000000000000000", --47
    "00000000000000000000000000000000", --48
    "00000000000000000000000000000000", --49
    "00000000000000000000000000000000", --50
    "00000000000000000000000000000000", --51
    "00000000000000000000000000000000", --52
    "00000000000000000000000000000000", --53
    "00000000000000000000000000000000", --54
    "00000000000000000000000000000000", --55
    "00000000000000000000000000000000", --56
    "00000000000000000000000000000000", --57
    "00000000000000000000000000000000", --58
    "00000000000000000000000000000000", --59
    "00000000000000000000000000000000", --60
    "00000000000000000000000000000000", --61
    "00000000000000000000000000000000", --62
    "00000000000000000000000000000000", --63
    "00000000000000000000000000000000", --64
    "00000000000000000000000000000000", --65
    "00000000000000000000000000000000", --66
    "00000000000000000000000000000000", --67
    "00000000000000000000000000000000", --68
    "00000000000000000000000000000000", --69
    "00000000000000000000000000000000", --70
    "00000000000000000000000000000000", --71
    "00000000000000000000000000000000", --72
    "00000000000000000000000000000000", --73
    "00000000000000000000000000000000", --74
    "00000000000000000000000000000000", --75
    "00000000000000000000000000000000", --76
    "00000000000000000000000000000000", --77
    "00000000000000000000000000000000", --78
    "00000000000000000000000000000000", --79
    "00000000000000000000000000000000", --80
    "00000000000000000000000000000000", --81
    "00000000000000000000000000000000", --82
    "00000000000000000000000000000000", --83
    "00000000000000000000000000000000", --84
    "00000000000000000000000000000000", --85
    "00000000000000000000000000000000", --86
    "00000000000000000000000000000000", --87
    "00000000000000000000000000000000", --88
    "00000000000000000000000000000000", --89
    "00000000000000000000000000000000", --90
    "00000000000000000000000000000000", --91
    "00000000000000000000000000000000", --92
    "00000000000000000000000000000000", --93
    "00000000000000000000000000000000", --94
    "00000000000000000000000000000000", --95
    "00000000000000000000000000000000", --96
    "00000000000000000000000000000000", --97
    "00000000000000000000000000000000", --98
    "00000000000000000000000000000000", --99
    "00000000000000000000000000000000", --100
    "00000000000000000000000000000000", --101
    "00000000000000000000000000000000", --102
    "00000000000000000000000000000000", --103
    "00000000000000000000000000000000", --104
    "00000000000000000000000000000000", --105
    "00000000000000000000000000000000", --106
    "00000000000000000000000000000000", --107
    "00000000000000000000000000000000", --108
    "00000000000000000000000000000000", --109
    "00000000000000000000000000000000", --110
    "00000000000000000000000000000000", --111
    "00000000000000000000000000000000", --112
    "00000000000000000000000000000000", --113
    "00000000000000000000000000000000", --114
    "00000000000000000000000000000000", --115
    "00000000000000000000000000000000", --116
    "00000000000000000000000000000000", --117
    "00000000000000000000000000000000", --118
    "00000000000000000000000000000000", --119
    "00000000000000000000000000000000", --120
    "00000000000000000000000000000000", --121
    "00000000000000000000000000000000", --122
    "00000000000000000000000000000000", --123
    "00000000000000000000000000000000", --124
    "00000000000000000000000000000000", --125
    "00000000000000000000000000000000", --126
    "00000000000000000000000000000000", --127
    "00000000000000000000000000000000", --128
    "00000000000000000000000000000000", --129
    "00000000000000000000000000000000", --130
    "00000000000000000000000000000000", --131
    "00000000000000000000000000000000", --132
    "00000000000000000000000000000000", --133
    "00000000000000000000000000000000", --134
    "00000000000000000000000000000000", --135
    "00000000000000000000000000000000", --136
    "00000000000000000000000000000000", --137
    "00000000000000000000000000000000", --138
    "00000000000000000000000000000000", --139
    "00000000000000000000000000000000", --140
    "00000000000000000000000000000000", --141
    "00000000000000000000000000000000", --142
    "00000000000000000000000000000000", --143
    "00000000000000000000000000000000", --144
    "00000000000000000000000000000000", --145
    "00000000000000000000000000000000", --146
    "00000000000000000000000000000000", --147
    "00000000000000000000000000000000", --148
    "00000000000000000000000000000000", --149
    "00000000000000000000000000000000", --150
    "00000000000000000000000000000000", --151
    "00000000000000000000000000000000", --152
    "00000000000000000000000000000000", --153
    "00000000000000000000000000000000", --154
    "00000000000000000000000000000000", --155
    "00000000000000000000000000000000", --156
    "00000000000000000000000000000000", --157
    "00000000000000000000000000000000", --158
    "00000000000000000000000000000000", --159
    "00000000000000000000000000000000", --160
    "00000000000000000000000000000000", --161
    "00000000000000000000000000000000", --162
    "00000000000000000000000000000000", --163
    "00000000000000000000000000000000", --164
    "00000000000000000000000000000000", --165
    "00000000000000000000000000000000", --166
    "00000000000000000000000000000000", --167
    "00000000000000000000000000000000", --168
    "00000000000000000000000000000000", --169
    "00000000000000000000000000000000", --170
    "00000000000000000000000000000000", --171
    "00000000000000000000000000000000", --172
    "00000000000000000000000000000000", --173
    "00000000000000000000000000000000", --174
    "00000000000000000000000000000000", --175
    "00000000000000000000000000000000", --176
    "00000000000000000000000000000000", --177
    "00000000000000000000000000000000", --178
    "00000000000000000000000000000000", --179
    "00000000000000000000000000000000", --180
    "00000000000000000000000000000000", --181
    "00000000000000000000000000000000", --182
    "00000000000000000000000000000000", --183
    "00000000000000000000000000000000", --184
    "00000000000000000000000000000000", --185
    "00000000000000000000000000000000", --186
    "00000000000000000000000000000000", --187
    "00000000000000000000000000000000", --188
    "00000000000000000000000000000000", --189
    "00000000000000000000000000000000", --190
    "00000000000000000000000000000000", --191
    "00000000000000000000000000000000", --192
    "00000000000000000000000000000000", --193
    "00000000000000000000000000000000", --194
    "00000000000000000000000000000000", --195
    "00000000000000000000000000000000", --196
    "00000000000000000000000000000000", --197
    "00000000000000000000000000000000", --198
    "00000000000000000000000000000000", --199
    "00000000000000000000000000000000", --200
    "00000000000000000000000000000000", --201
    "00000000000000000000000000000000", --202
    "00000000000000000000000000000000", --203
    "00000000000000000000000000000000", --204
    "00000000000000000000000000000000", --205
    "00000000000000000000000000000000", --206
    "00000000000000000000000000000000", --207
    "00000000000000000000000000000000", --208
    "00000000000000000000000000000000", --209
    "00000000000000000000000000000000", --210
    "00000000000000000000000000000000", --211
    "00000000000000000000000000000000", --212
    "00000000000000000000000000000000", --213
    "00000000000000000000000000000000", --214
    "00000000000000000000000000000000", --215
    "00000000000000000000000000000000", --216
    "00000000000000000000000000000000", --217
    "00000000000000000000000000000000", --218
    "00000000000000000000000000000000", --219
    "00000000000000000000000000000000", --220
    "00000000000000000000000000000000", --221
    "00000000000000000000000000000000", --222
    "00000000000000000000000000000000", --223
    "00000000000000000000000000000000", --224
    "00000000000000000000000000000000", --225
    "00000000000000000000000000000000", --226
    "00000000000000000000000000000000", --227
    "00000000000000000000000000000000", --228
    "00000000000000000000000000000000", --229
    "00000000000000000000000000000000", --230
    "00000000000000000000000000000000", --231
    "00000000000000000000000000000000", --232
    "00000000000000000000000000000000", --233
    "00000000000000000000000000000000", --234
    "00000000000000000000000000000000", --235
    "00000000000000000000000000000000", --236
    "00000000000000000000000000000000", --237
    "00000000000000000000000000000000", --238
    "00000000000000000000000000000000", --239
    "00000000000000000000000000000000", --240
    "00000000000000000000000000000000", --241
    "00000000000000000000000000000000", --242
    "00000000000000000000000000000000", --243
    "00000000000000000000000000000000", --244
    "00000000000000000000000000000000", --245
    "00000000000000000000000000000000", --246
    "00000000000000000000000000000000", --247
    "00000000000000000000000000000000", --248
    "00000000000000000000000000000000", --249
    "00000000000000000000000000000000", --250
    "00000000000000000000000000000000", --251
    "00000000000000000000000000000000", --252
    "00000000000000000000000000000000", --253
    "00000000000000000000000000000000", --254
    "00000000000000000000000000000000", --255
    "00000000000000000000000000000000", --256
    "00000000000000000000000000000000", --257
    "00000000000000000000000000000000", --258
    "00000000000000000000000000000000", --259
    "00000000000000000000000000000000", --260
    "00000000000000000000000000000000", --261
    "00000000000000000000000000000000", --262
    "00000000000000000000000000000000", --263
    "00000000000000000000000000000000", --264
    "00000000000000000000000000000000", --265
    "00000000000000000000000000000000", --266
    "00000000000000000000000000000000", --267
    "00000000000000000000000000000000", --268
    "00000000000000000000000000000000", --269
    "00000000000000000000000000000000", --270
    "00000000000000000000000000000000", --271
    "00000000000000000000000000000000", --272
    "00000000000000000000000000000000", --273
    "00000000000000000000000000000000", --274
    "00000000000000000000000000000000", --275
    "00000000000000000000000000000000", --276
    "00000000000000000000000000000000", --277
    "00000000000000000000000000000000", --278
    "00000000000000000000000000000000", --279
    "00000000000000000000000000000000", --280
    "00000000000000000000000000000000", --281
    "00000000000000000000000000000000", --282
    "00000000000000000000000000000000", --283
    "00000000000000000000000000000000", --284
    "00000000000000000000000000000000", --285
    "00000000000000000000000000000000", --286
    "00000000000000000000000000000000", --287
    "00000000000000000000000000000000", --288
    "00000000000000000000000000000000", --289
    "00000000000000000000000000000000", --290
    "00000000000000000000000000000000", --291
    "00000000000000000000000000000000", --292
    "00000000000000000000000000000000", --293
    "00000000000000000000000000000000", --294
    "00000000000000000000000000000000", --295
    "00000000000000000000000000000000", --296
    "00000000000000000000000000000000", --297
    "00000000000000000000000000000000", --298
    "00000000000000000000000000000000", --299
    "00000000000000000000000000000000", --300
    "00000000000000000000000000000000", --301
    "00000000000000000000000000000000", --302
    "00000000000000000000000000000000", --303
    "00000000000000000000000000000000", --304
    "00000000000000000000000000000000", --305
    "00000000000000000000000000000000", --306
    "00000000000000000000000000000000", --307
    "00000000000000000000000000000000", --308
    "00000000000000000000000000000000", --309
    "00000000000000000000000000000000", --310
    "00000000000000000000000000000000", --311
    "00000000000000000000000000000000", --312
    "00000000000000000000000000000000", --313
    "00000000000000000000000000000000", --314
    "00000000000000000000000000000000", --315
    "00000000000000000000000000000000", --316
    "00000000000000000000000000000000", --317
    "00000000000000000000000000000000", --318
    "00000000000000000000000000000000", --319
    "00000000000000000000000000000000", --320
    "00000000000000000000000000000000", --321
    "00000000000000000000000000000000", --322
    "00000000000000000000000000000000", --323
    "00000000000000000000000000000000", --324
    "00000000000000000000000000000000", --325
    "00000000000000000000000000000000", --326
    "00000000000000000000000000000000", --327
    "00000000000000000000000000000000", --328
    "00000000000000000000000000000000", --329
    "00000000000000000000000000000000", --330
    "00000000000000000000000000000000", --331
    "00000000000000000000000000000000", --332
    "00000000000000000000000000000000", --333
    "00000000000000000000000000000000", --334
    "00000000000000000000000000000000", --335
    "00000000000000000000000000000000", --336
    "00000000000000000000000000000000", --337
    "00000000000000000000000000000000", --338
    "00000000000000000000000000000000", --339
    "00000000000000000000000000000000", --340
    "00000000000000000000000000000000", --341
    "00000000000000000000000000000000", --342
    "00000000000000000000000000000000", --343
    "00000000000000000000000000000000", --344
    "00000000000000000000000000000000", --345
    "00000000000000000000000000000000", --346
    "00000000000000000000000000000000", --347
    "00000000000000000000000000000000", --348
    "00000000000000000000000000000000", --349
    "00000000000000000000000000000000", --350
    "00000000000000000000000000000000", --351
    "00000000000000000000000000000000", --352
    "00000000000000000000000000000000", --353
    "00000000000000000000000000000000", --354
    "00000000000000000000000000000000", --355
    "00000000000000000000000000000000", --356
    "00000000000000000000000000000000", --357
    "00000000000000000000000000000000", --358
    "00000000000000000000000000000000", --359
    "00000000000000000000000000000000", --360
    "00000000000000000000000000000000", --361
    "00000000000000000000000000000000", --362
    "00000000000000000000000000000000", --363
    "00000000000000000000000000000000", --364
    "00000000000000000000000000000000", --365
    "00000000000000000000000000000000", --366
    "00000000000000000000000000000000", --367
    "00000000000000000000000000000000", --368
    "00000000000000000000000000000000", --369
    "00000000000000000000000000000000", --370
    "00000000000000000000000000000000", --371
    "00000000000000000000000000000000", --372
    "00000000000000000000000000000000", --373
    "00000000000000000000000000000000", --374
    "00000000000000000000000000000000", --375
    "00000000000000000000000000000000", --376
    "00000000000000000000000000000000", --377
    "00000000000000000000000000000000", --378
    "00000000000000000000000000000000", --379
    "00000000000000000000000000000000", --380
    "00000000000000000000000000000000", --381
    "00000000000000000000000000000000", --382
    "00000000000000000000000000000000", --383
    "00000000000000000000000000000000", --384
    "00000000000000000000000000000000", --385
    "00000000000000000000000000000000", --386
    "00000000000000000000000000000000", --387
    "00000000000000000000000000000000", --388
    "00000000000000000000000000000000", --389
    "00000000000000000000000000000000", --390
    "00000000000000000000000000000000", --391
    "00000000000000000000000000000000", --392
    "00000000000000000000000000000000", --393
    "00000000000000000000000000000000", --394
    "00000000000000000000000000000000", --395
    "00000000000000000000000000000000", --396
    "00000000000000000000000000000000", --397
    "00000000000000000000000000000000", --398
    "00000000000000000000000000000000", --399
    "00000000000000000000000000000000", --400
    "00000000000000000000000000000000", --401
    "00000000000000000000000000000000", --402
    "00000000000000000000000000000000", --403
    "00000000000000000000000000000000", --404
    "00000000000000000000000000000000", --405
    "00000000000000000000000000000000", --406
    "00000000000000000000000000000000", --407
    "00000000000000000000000000000000", --408
    "00000000000000000000000000000000", --409
    "00000000000000000000000000000000", --410
    "00000000000000000000000000000000", --411
    "00000000000000000000000000000000", --412
    "00000000000000000000000000000000", --413
    "00000000000000000000000000000000", --414
    "00000000000000000000000000000000", --415
    "00000000000000000000000000000000", --416
    "00000000000000000000000000000000", --417
    "00000000000000000000000000000000", --418
    "00000000000000000000000000000000", --419
    "00000000000000000000000000000000", --420
    "00000000000000000000000000000000", --421
    "00000000000000000000000000000000", --422
    "00000000000000000000000000000000", --423
    "00000000000000000000000000000000", --424
    "00000000000000000000000000000000", --425
    "00000000000000000000000000000000", --426
    "00000000000000000000000000000000", --427
    "00000000000000000000000000000000", --428
    "00000000000000000000000000000000", --429
    "00000000000000000000000000000000", --430
    "00000000000000000000000000000000", --431
    "00000000000000000000000000000000", --432
    "00000000000000000000000000000000", --433
    "00000000000000000000000000000000", --434
    "00000000000000000000000000000000", --435
    "00000000000000000000000000000000", --436
    "00000000000000000000000000000000", --437
    "00000000000000000000000000000000", --438
    "00000000000000000000000000000000", --439
    "00000000000000000000000000000000", --440
    "00000000000000000000000000000000", --441
    "00000000000000000000000000000000", --442
    "00000000000000000000000000000000", --443
    "00000000000000000000000000000000", --444
    "00000000000000000000000000000000", --445
    "00000000000000000000000000000000", --446
    "00000000000000000000000000000000", --447
    "00000000000000000000000000000000", --448
    "00000000000000000000000000000000", --449
    "00000000000000000000000000000000", --450
    "00000000000000000000000000000000", --451
    "00000000000000000000000000000000", --452
    "00000000000000000000000000000000", --453
    "00000000000000000000000000000000", --454
    "00000000000000000000000000000000", --455
    "00000000000000000000000000000000", --456
    "00000000000000000000000000000000", --457
    "00000000000000000000000000000000", --458
    "00000000000000000000000000000000", --459
    "00000000000000000000000000000000", --460
    "00000000000000000000000000000000", --461
    "00000000000000000000000000000000", --462
    "00000000000000000000000000000000", --463
    "00000000000000000000000000000000", --464
    "00000000000000000000000000000000", --465
    "00000000000000000000000000000000", --466
    "00000000000000000000000000000000", --467
    "00000000000000000000000000000000", --468
    "00000000000000000000000000000000", --469
    "00000000000000000000000000000000", --470
    "00000000000000000000000000000000", --471
    "00000000000000000000000000000000", --472
    "00000000000000000000000000000000", --473
    "00000000000000000000000000000000", --474
    "00000000000000000000000000000000", --475
    "00000000000000000000000000000000", --476
    "00000000000000000000000000000000", --477
    "00000000000000000000000000000000", --478
    "00000000000000000000000000000000", --479
    "00000000000000000000000000000000", --480
    "00000000000000000000000000000000", --481
    "00000000000000000000000000000000", --482
    "00000000000000000000000000000000", --483
    "00000000000000000000000000000000", --484
    "00000000000000000000000000000000", --485
    "00000000000000000000000000000000", --486
    "00000000000000000000000000000000", --487
    "00000000000000000000000000000000", --488
    "00000000000000000000000000000000", --489
    "00000000000000000000000000000000", --490
    "00000000000000000000000000000000", --491
    "00000000000000000000000000000000", --492
    "00000000000000000000000000000000", --493
    "00000000000000000000000000000000", --494
    "00000000000000000000000000000000", --495
    "00000000000000000000000000000000", --496
    "00000000000000000000000000000000", --497
    "00000000000000000000000000000000", --498
    "00000000000000000000000000000000", --499
    "00000000000000000000000000000000", --500
    "00000000000000000000000000000000", --501
    "00000000000000000000000000000000", --502
    "00000000000000000000000000000000", --503
    "00000000000000000000000000000000", --504
    "00000000000000000000000000000000", --505
    "00000000000000000000000000000000", --506
    "00000000000000000000000000000000", --507
    "00000000000000000000000000000000", --508
    "00000000000000000000000000000000", --509
    "00000000000000000000000000000000", --510
    "00000000000000000000000000000000"  --511
  );

  signal adr_content : STD_LOGIC_VECTOR(31 downto 0);

  begin
    adr_content <= Memory512x32(to_integer(unsigned(address_mem(8 downto 0))));
    Memory512x32(to_integer(unsigned(address_mem(8 downto 0)))) <= write_data when mem_write = '1';
    read_data <= adr_content when mem_write = '0';
end Behavioral;

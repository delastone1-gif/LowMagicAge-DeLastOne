_wld_terrs_db={-- z_wld_terr
[wt_pln_grs			]={z="草原		Grassland			"	,c=0xff436610,mov=pass_h1},-- 3/4 3r 地形颜色c用于小地图
[wt_pln_frm			]={z="农地		Farmland			"	,c=0xfff6bb42,mov=pass_h1},-- 3/4 d1923f daa520 dea32c f5deb3 f6bb42
[wt_pln_btl			]={z="战场		Battlefield			"	,c=0xff82b325,mov=pass_h1},-- 3/4

[wt_dst_rck			]={z="岩漠		Rocky Desert		"	,c=0xff53584a,mov=pass_h2},-- 1/2
[wt_dst_snd			]={z="沙漠		Sandy Desert		"	,c=0xffcfc48f,mov=pass_h2},-- 1/2
[wt_dst_tdr			]={z="苔原		Tundra				"	,c=0xffc2c6b4,mov=pass_h1},-- 3/4

[wt_msh_mor			]={z="浅水沼泽	Moor				"	,c=0xff982fcc,mov=pass_h2},-- 3/4
[wt_msh_swm			]={z="深水沼泽	Swamp				"	,c=0xff631a88,mov=pass_h3},-- 1/2

[wt_fst_sps			]={z="稀疏森林	Sparse Forest		"	,c=0xff94c190,mov=pass_h1},-- 1/2
[wt_fst_mdm			]={z="普通森林	Medium Forest		"	,c=0xff4c8c45,mov=pass_h2},-- 1/2
[wt_fst_dns			]={z="茂密森林	Dense Forest		"	,c=0xff164d11,mov=pass_h3},-- 1/2

[wt_hll_gtl			]={z="平缓丘陵	Gentle Hill			"	,c=0xffd4a969,mov=pass_h2},-- 1/2
[wt_hll_rug			]={z="崎岖丘陵	Rugged Hill			"	,c=0xff96784b,mov=pass_h3},-- 1/2

[wt_mtn_alp			]={z="高山草甸	Alpine Meadow		"	,c=0xffda6e6e,mov=pass_h2},-- 1/2
[wt_mtn_rug			]={z="崎岖山脉	Rugged Mountain		"	,c=0xffaf3030,mov=pass_h3},-- 1/2
[wt_mtn_fbd			]={z="山峰		Forbidding Mountain	"	,c=0xff700a0a,mov=pass_h4},-- 1/2

[wt_aqt_stm			]={z="溪流		Stream				"	,c=0xff73e3c1,mov=pass_hx},
[wt_aqt_rvr			]={z="河流		River				"	,c=0xff31be94,mov=pass_hx},
[wt_aqt_lak			]={z="湖泊		Lake				"	,c=0xff1f80d5,mov=pass_hx},
[wt_aqt_sse			]={z="浅海		Shallow Sea			"	,c=0xff205f96,mov=pass_hx},
[wt_aqt_dse			]={z="深海		Deep Sea			"	,c=0xff104f86,mov=pass_hx},
}
z_trim_nds(wld_terrs_text)
z_cpy_nds(_wld_terrs_db, wld_terrs_text)

wld_road_c		= 0xffeeddbb-- 道路颜色 用于小地图


-- 杂项遭遇 misc encounters
-- z_misc_enc_res
er_srch_succ	= 0x0001-- 搜索成功 srch20共用
er_srch_fail	= 0x0002-- 搜索失败
er_untrap_succ	= 0x0004-- 解除陷阱成功
er_untrap_fail	= 0x0008-- 解除陷阱失败
er_unlock_succ	= 0x0010-- 开锁成功
er_unlock_fail	= 0x0020-- 开锁失败
er_trap_tgr_off	= 0x0100-- 陷阱已触发并失效 自动重置的不算
er_trap_dead	= 0x0200-- 陷阱已失效 已解除或触发失效 便于misc_encs.succ_if使用
er_succ			= 0x0400-- 遭遇成功
er_fail			= 0x0800-- 遭遇失败
er_rush			= 0x4000-- 强行通过
er_mr_ok		= 0x8000-- 确认关闭

-- z_misc_enc
me_mob			=  1-- 怪物		占位/测试
me_srch			=  2-- 搜索		...
me_srch20		=  3-- 反复搜索	...
me_untrap		=  4-- 解除陷阱	...
me_unlock		=  5-- 开锁		...
me_wld_sup		=  6-- 搜索补给	世界冒险地点
me_wld_trap		=  7-- 陷阱宝藏	...
me_wld_lock		=  8-- 开锁宝藏	...
me_dgn_sup		=  9-- 搜索补给	地牢版本
me_dgn_trap		= 10-- 陷阱		...
me_dgn_lock		= 11-- 开锁宝藏	...

misc_wsite_enc_rates = {me_mob,4, me_wld_sup,4, me_wld_trap,8, me_wld_lock,8}-- 世界冒险地点各遭遇几率

misc_encs={
[me_mob			]={k="me_mob		"},
[me_srch		]={k="me_srch		",op=so_srch	,succ_if=er_srch_succ	},
[me_srch20		]={k="me_srch20		",op=so_srch20	,succ_if=er_srch_succ	,fail_if=er_srch_fail	},
[me_untrap		]={k="me_untrap		",op=so_untrap	,succ_if=er_untrap_succ	},
[me_unlock		]={k="me_unlock		",op=so_unlock	,succ_if=er_unlock_succ	},
[me_wld_sup		]={k="me_wld_sup	",op=so_srch20	,succ_if=er_srch_succ	,fail_if=er_srch_fail	,loot="rd_cmn_res"	,start_s=s1_me_wld_sup	,succ_s=s2_me_wld_sup	,fail_s=s3_me_wld_sup},
[me_wld_trap	]={k="me_wld_trap	",op=so_srch	,succ_if=er_trap_dead							,loot="rd_treasure"	,start_s=s1_me_wld_trap	,succ_s=s2_me_wld_trap	},
[me_wld_lock	]={k="me_wld_lock	",op=so_unlock	,succ_if=er_unlock_succ							,loot="rd_treasure"	,start_s=s1_me_wld_lock	,succ_s=s2_me_wld_lock	},
[me_dgn_sup		]={k="me_dgn_sup	",op=so_srch20	,succ_if=er_srch_succ	,fail_if=er_srch_fail	,loot="rd_cmn_res"	,start_s=s1_me_dgn_sup	,succ_s=s2_me_dgn_sup	,fail_s=s3_me_dgn_sup},
[me_dgn_trap	]={k="me_dgn_trap	",op=so_srch	,succ_if=er_trap_dead												,start_s=s1_me_dgn_trap	,succ_s=s2_me_dgn_trap	},
[me_dgn_lock	]={k="me_dgn_lock	",op=so_unlock	,succ_if=er_unlock_succ							,loot="rd_treasure"	,start_s=s1_me_dgn_lock	,succ_s=s2_me_dgn_lock	},
}
z_trim_tbl_texts(misc_encs)


-- 区域地图 local maps

-- z_tile_flags
tf_auto		= 0x01-- auto tile
tf_easy		= 0x02-- 易于操作 耗时减半

-- z_loc_tile
lt_dirt_0		= 1010-- 土地
lt_dirt_1		= 1011-- 土地1
lt_dirt_2		= 1012-- 土地2
lt_dirt_3		= 1013-- 土地3
lt_dirt_w_0		= 1014-- 土墙
lt_dirt_w_1		= 1015-- 土墙1
lt_dirt_w_2		= 1016-- 土墙2
lt_dirt_w_3		= 1017-- 土墙3
lt_dirt_o		= 1018-- 土堆
lt_dirt_x		= 1019-- 土地边界

lt_grss_0		= 1020-- 草地
lt_grss_1		= 1021-- 草地1
lt_grss_2		= 1022-- 草地2
lt_grss_3		= 1023-- 草地3
lt_grss_w_0		= 1024-- 草墙
lt_grss_w_1		= 1025-- 草墙1
lt_grss_w_2		= 1026-- 草墙2
lt_grss_w_3		= 1027-- 草墙3
lt_grss_o		= 1028-- 草堆
lt_grss_x		= 1029-- 草地边界

lt_rock_0		= 1030-- 石地
lt_rock_1		= 1031-- 石地1
lt_rock_2		= 1032-- 石地2
lt_rock_3		= 1033-- 石地3
lt_rock_w_0		= 1034-- 石墙
lt_rock_w_1		= 1035-- 石墙1
lt_rock_w_2		= 1036-- 石墙2
lt_rock_w_3		= 1037-- 石墙3
lt_rock_o		= 1038-- 石堆
lt_rock_x		= 1039-- 石地边界

lt_hard_0		= 2010-- 困难地形0
lt_hard_1		= 2011-- 困难地形1
lt_hard_2		= 2012-- 困难地形2
lt_hard_3		= 2013-- 困难地形3

lt_tree_0		= 2110-- 树0
lt_tree_1		= 2111-- 树1
lt_tree_2		= 2112-- 树2
lt_tree_3		= 2113-- 树3
lt_tree_k		= 2118-- 黒树	黒木树	Darkwood Tree

lt_sandstone	= 2210-- 砂岩
lt_slate		= 2220-- 板岩
lt_limestone	= 2230-- 石灰岩
lt_marble		= 2240-- 大理石
lt_granite		= 2250-- 花岗岩
lt_basalt		= 2260-- 玄武岩
lt_quartzite	= 2270-- 石英岩

lt_cpr			= 2310-- 铜矿
lt_tin			= 2320-- 锡矿
lt_iron			= 2330-- 铁矿
lt_slvr			= 2340-- 银矿
lt_gold			= 2350-- 金矿
lt_plat			= 2360-- 白金矿
lt_ironc		= 2370-- 寒铁矿
lt_mith			= 2380-- 秘银矿
lt_adam			= 2390-- 精金矿

lt_coal			= 2410-- 煤矿

lt_up			= 4010-- 向上
lt_down			= 4011-- 向下
lt_enter		= 4020-- 进入
lt_leave		= 4021-- 离开


-- 转义
--lt_rd_dirt		= 8010-- 随机泥土地

lt_rd_wood			= 8110-- 随机树木
lt_rd_wood_cmn		= 8111-- 随机树木	常见
lt_rd_wood_rare		= 8112-- 随机树木	罕见
lt_rd_rock			= 8120-- 随机岩石
lt_rd_rock_cmn		= 8121-- 随机岩石	常见
lt_rd_rock_rare		= 8122-- 随机岩石	罕见
lt_rd_ore			= 8130-- 随机金属矿
lt_rd_ore_cmn		= 8131-- 随机金属矿	常见
lt_rd_ore_rare		= 8132-- 随机金属矿	罕见
lt_rd_minable		= 8140-- 随机开采物
lt_rd_minable_cmn	= 8141-- 随机开采物	常见
lt_rd_minable_rare	= 8142-- 随机开采物	罕见

--[[
mov		行走通过性
vis		视线通过性 默认=mov 可单独设置 如困难地形
cols	变体子图列数 默认=4
]]

-- z_loc_tile gfx\loc_tiles
loc_tiles={
[lt_dirt_0		]={k="1010_dirt		",n=n_lt_dirt_0		,mov=pass_h1},
[lt_dirt_1		]={k="1011_dirt		",n=n_lt_dirt_1		,mov=pass_h1},
[lt_dirt_2		]={k="1012_dirt		",n=n_lt_dirt_2		,mov=pass_h1},
[lt_dirt_3		]={k="1013_dirt		",n=n_lt_dirt_3		,mov=pass_h1},
[lt_dirt_w_0	]={k="1014_dirt_w	",n=n_lt_dirt_w_0	,mov=pass_hx					,op=op_shovel	,flags=tf_auto + tf_easy},
[lt_dirt_w_1	]={k="1015_dirt_w	",n=n_lt_dirt_w_1	,mov=pass_hx					,op=op_shovel	,flags=tf_auto + tf_easy},
[lt_dirt_w_2	]={k="1016_dirt_w	",n=n_lt_dirt_w_2	,mov=pass_hx					,op=op_shovel	,flags=tf_auto + tf_easy},
[lt_dirt_w_3	]={k="1017_dirt_w	",n=n_lt_dirt_w_3	,mov=pass_hx					,op=op_shovel	,flags=tf_auto + tf_easy},
[lt_dirt_o		]={k="1018_dirt_o	",n=n_lt_dirt_o		,mov=pass_hx					,op=op_shovel	,flags=			 tf_easy},
[lt_dirt_x		]={k="1019_dirt_x	",n=n_lt_dirt_x		,mov=pass_hx									,flags=tf_auto},

[lt_grss_0		]={k="1020_grss		",n=n_lt_grss_0		,mov=pass_h1},
[lt_grss_1		]={k="1021_grss		",n=n_lt_grss_1		,mov=pass_h1},
[lt_grss_2		]={k="1022_grss		",n=n_lt_grss_2		,mov=pass_h1},
[lt_grss_3		]={k="1023_grss		",n=n_lt_grss_3		,mov=pass_h1},
[lt_grss_w_0	]={k="1024_grss_w	",n=n_lt_grss_w_0	,mov=pass_hx					,op=op_shovel	,flags=tf_auto + tf_easy},
[lt_grss_w_1	]={k="1025_grss_w	",n=n_lt_grss_w_1	,mov=pass_hx					,op=op_shovel	,flags=tf_auto + tf_easy},
[lt_grss_w_2	]={k="1026_grss_w	",n=n_lt_grss_w_2	,mov=pass_hx					,op=op_shovel	,flags=tf_auto + tf_easy},
[lt_grss_w_3	]={k="1027_grss_w	",n=n_lt_grss_w_3	,mov=pass_hx					,op=op_shovel	,flags=tf_auto + tf_easy},
[lt_grss_o		]={k="1028_grss_o	",n=n_lt_grss_o		,mov=pass_hx					,op=op_shovel	,flags=			 tf_easy},
[lt_grss_x		]={k="1029_grss_x	",n=n_lt_grss_x		,mov=pass_hx									,flags=tf_auto},

[lt_rock_0		]={k="1030_rock		",n=n_lt_rock_0		,mov=pass_h1},
[lt_rock_1		]={k="1031_rock		",n=n_lt_rock_1		,mov=pass_h1},
[lt_rock_2		]={k="1032_rock		",n=n_lt_rock_2		,mov=pass_h1},
[lt_rock_3		]={k="1033_rock		",n=n_lt_rock_3		,mov=pass_h1},
[lt_rock_w_0	]={k="1034_rock_w	",n=n_lt_rock_w_0	,mov=pass_hx					,op=op_shovel	,flags=tf_auto},
[lt_rock_w_1	]={k="1035_rock_w	",n=n_lt_rock_w_1	,mov=pass_hx					,op=op_shovel	,flags=tf_auto},
[lt_rock_w_2	]={k="1036_rock_w	",n=n_lt_rock_w_2	,mov=pass_hx					,op=op_shovel	,flags=tf_auto},
[lt_rock_w_3	]={k="1037_rock_w	",n=n_lt_rock_w_3	,mov=pass_hx					,op=op_shovel	,flags=tf_auto},
[lt_rock_o		]={k="1038_rock_o	",n=n_lt_rock_o		,mov=pass_hx					,op=op_shovel	},
[lt_rock_x		]={k="1039_rock_x	",n=n_lt_rock_x		,mov=pass_hx									,flags=tf_auto},

[lt_hard_0		]={k="2010_hard		",n=n_lt_hard_0		,mov=pass_h2	,vis=pass_h1	},
[lt_hard_1		]={k="2011_hard		",n=n_lt_hard_1		,mov=pass_h2	,vis=pass_h1	},
[lt_hard_2		]={k="2012_hard		",n=n_lt_hard_2		,mov=pass_h2	,vis=pass_h1	},
[lt_hard_3		]={k="2013_hard		",n=n_lt_hard_3		,mov=pass_h2	,vis=pass_h1	},

[lt_tree_0		]={k="2110_tree		",n=n_lt_tree_0		,mov=pass_hx					,op=op_chop		,flags=tf_auto	,itm=itm_wood		},
[lt_tree_1		]={k="2111_tree		",n=n_lt_tree_1		,mov=pass_hx					,op=op_chop		,flags=tf_auto	,itm=itm_wood		},
[lt_tree_2		]={k="2112_tree		",n=n_lt_tree_2		,mov=pass_hx					,op=op_chop		,flags=tf_auto	,itm=itm_wood		},
[lt_tree_3		]={k="2113_tree		",n=n_lt_tree_3		,mov=pass_hx					,op=op_chop		,flags=tf_auto	,itm=itm_wood		},
[lt_tree_k		]={k="2118_tree_k	",n=n_lt_tree_k		,mov=pass_hx					,op=op_chop		,flags=tf_auto	,itm=itm_woodk		},

[lt_sandstone	]={k="2210_sandstone",n=n_lt_sandstone	,mov=pass_hx					,op=op_mine						,itm=itm_sandstone	},
[lt_slate		]={k="2220_slate	",n=n_lt_slate		,mov=pass_hx					,op=op_mine						,itm=itm_slate		},
[lt_limestone	]={k="2230_limestone",n=n_lt_limestone	,mov=pass_hx					,op=op_mine						,itm=itm_limestone	},
[lt_marble		]={k="2240_marble	",n=n_lt_marble		,mov=pass_hx					,op=op_mine						,itm=itm_marble		},
[lt_granite		]={k="2250_granite	",n=n_lt_granite	,mov=pass_hx					,op=op_mine						,itm=itm_granite	},
[lt_basalt		]={k="2260_basalt	",n=n_lt_basalt		,mov=pass_hx					,op=op_mine						,itm=itm_basalt		},
[lt_quartzite	]={k="2270_quartzite",n=n_lt_quartzite	,mov=pass_hx					,op=op_mine						,itm=itm_quartzite	},

[lt_cpr			]={k="2310_cpr		",n=n_lt_cpr		,mov=pass_hx					,op=op_mine						,itm=itm_ore_cpr	},
[lt_tin			]={k="2320_tin		",n=n_lt_tin		,mov=pass_hx					,op=op_mine						,itm=itm_ore_tin	},
[lt_iron		]={k="2330_iron		",n=n_lt_iron		,mov=pass_hx					,op=op_mine						,itm=itm_ore_iron	},
[lt_slvr		]={k="2340_slvr		",n=n_lt_slvr		,mov=pass_hx					,op=op_mine						,itm=itm_ore_slvr	},
[lt_gold		]={k="2350_gold		",n=n_lt_gold		,mov=pass_hx					,op=op_mine						,itm=itm_ore_gold	},
[lt_plat		]={k="2360_plat		",n=n_lt_plat		,mov=pass_hx					,op=op_mine						,itm=itm_ore_plat	},
[lt_ironc		]={k="2370_ironc	",n=n_lt_ironc		,mov=pass_hx					,op=op_mine						,itm=itm_ore_ironc	},
[lt_mith		]={k="2380_mith		",n=n_lt_mith		,mov=pass_hx					,op=op_mine						,itm=itm_ore_mith	},
[lt_adam		]={k="2390_adam		",n=n_lt_adam		,mov=pass_hx					,op=op_mine						,itm=itm_ore_adam	},

[lt_coal		]={k="2410_coal		",n=n_lt_coal		,mov=pass_hx					,op=op_mine						,itm=itm_coal		},

[lt_up			]={k="4010_up		",n=n_lt_up			,mov=pass_h2	,vis=pass_h1	,op=op_up											,cols=1},--,flags=tf_up
[lt_down		]={k="4011_down		",n=n_lt_down		,mov=pass_h2	,vis=pass_h1	,op=op_down											,cols=1},
[lt_enter		]={k="4020_enter	",n=n_lt_enter		,mov=pass_h1					,op=op_enter										,cols=1},
[lt_leave		]={k="4021_leave	",n=n_lt_leave		,mov=pass_h1					,op=op_leave										,cols=1},
}
z_trim_tbl_texts(loc_tiles)


-- z_loc_map_tpl 方便起见 使用z_loc_tile对应id	仅用于loc_tp_map_infos 存档无关
lmt_def			= 1000-- 默认 占位
lmt_test		= 1001-- 测试

lmt_tree_0		= 2110-- 树
lmt_tree_1		= 2111
lmt_tree_2		= 2112
lmt_tree_3		= 2113

lmt_sandstone	= 2210-- 砂岩
lmt_slate		= 2220-- 板岩
lmt_limestone	= 2230-- 石灰岩
lmt_marble		= 2240-- 大理石
lmt_granite		= 2250-- 花岗岩
lmt_basalt		= 2260-- 玄武岩
lmt_quartzite	= 2270-- 石英岩

lmt_cmn_rock	= 2294-- 常用石料	lmt_limestone	lmt_marble		lmt_granite
lmt_val_rock	= 2296-- 贵重石料	lmt_basalt		lmt_quartzite

lmt_cpr			= 2310-- 铜矿
lmt_tin			= 2320-- 锡矿
lmt_iron		= 2330-- 铁矿
lmt_slvr		= 2340-- 银矿
lmt_gold		= 2350-- 金矿
lmt_plat		= 2360-- 白金矿
lmt_ironc		= 2370-- 寒铁矿
lmt_mith		= 2380-- 秘银矿
lmt_adam		= 2390-- 精金矿

lmt_val_metal	= 2394-- 贵金属		lmt_slvr		lmt_gold		lt_plat
lmt_sp_metal	= 2396-- 特殊金属	lmt_ironc		lmt_mith		lmt_adam

lmt_coal		= 2410-- 煤矿

-- z_loc_map_tp_flag
mf_fld	= 1-- 野地 0=资源图

-- grnd	地面
-- bdr	边界

loc_map_tpls={-- z_add_site.res
[lmt_def		]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_tree_0		,10,20																	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5											}},
[lmt_test		]={grnd=lt_dirt_0					,floods={lt_dirt_w_0	,20,40	,lt_tree_0		,10,20																	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5											},flags=mf_fld},

[lmt_tree_0		]={grnd=lt_grss_0	,bdr=lt_dirt_x	,floods={lt_tree_0		,20,40	,lt_tree_1		, 5,10																	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_cmn ,2,5	,lt_tree_k,0,2	}},
[lmt_tree_1		]={grnd=lt_grss_0	,bdr=lt_dirt_x	,floods={lt_tree_1		,20,40	,lt_tree_0		, 5,10																	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_cmn ,2,5	,lt_tree_k,0,2	}},
[lmt_tree_2		]={grnd=lt_grss_0	,bdr=lt_dirt_x	,floods={lt_tree_2		,20,40	,lt_tree_3		, 5,10																	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_cmn ,2,5	,lt_tree_k,2,5	}},
[lmt_tree_3		]={grnd=lt_grss_0	,bdr=lt_dirt_x	,floods={lt_tree_3		,20,40	,lt_tree_2		, 5,10																	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_cmn ,2,5	,lt_tree_k,2,5	}},

[lmt_sandstone	]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_sandstone	,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_cmn ,5,10				}},
[lmt_slate		]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_slate		,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_cmn ,5,10				}},
[lmt_limestone	]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_limestone	,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_cmn ,5,10				}},
[lmt_marble		]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_marble		,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_cmn ,5,10				}},
[lmt_granite	]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_granite		,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_rare,5,10				}},
[lmt_basalt		]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_basalt		,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_rare,5,10				}},
[lmt_quartzite	]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_quartzite	,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_rare,5,10				}},

[lmt_cmn_rock	]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,10,20	,lt_limestone	,10,20	,lmt_marble	, 5,10	,lmt_granite	,5,10	,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_cmn ,5,10				}},
[lmt_val_rock	]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,10,20	,lmt_granite	,10,20	,lt_basalt	, 5,10	,lmt_quartzite	,5,10	,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_rare,5,10				}},

[lmt_cpr		]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_cpr			,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_cmn ,5,10				}},
[lmt_tin		]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_tin			,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_cmn ,5,10				}},
[lmt_iron		]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_iron		,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_cmn ,5,10				}},
[lmt_slvr		]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_slvr		,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_cmn ,5,10				}},
[lmt_gold		]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_gold		,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_rare,5,10				}},
[lmt_plat		]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_plat		,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_rare,5,10				}},
[lmt_ironc		]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_ironc		,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_rare,5,10				}},
[lmt_mith		]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_mith		,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_rare,5,10				}},
[lmt_adam		]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lt_adam		,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_rare,5,10				}},

[lmt_val_metal	]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,15,30	,lmt_slvr		,10,20	,lmt_gold	,5,10							,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_rare,5,10,lt_plat,2,5	}},
[lmt_sp_metal	]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,10,20	,lmt_ironc		,10,20	,lmt_mith	,5,10	,lmt_adam		,5,10	,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_rare,5,10				}},

[lmt_coal		]={grnd=lt_dirt_0	,bdr=lt_dirt_x	,floods={lt_dirt_w_0	,20,40	,lmt_coal		,10,20												,lt_rd_wood_cmn,2,5	},noises={lt_hard_0,2,5	,lt_dirt_o,2,5	,lt_rd_minable_cmn ,5,10				}},
}

local _site_lyr_max	= 2000-- 资源地点最大层数 对应无限等级 z_pc_lv_max.site_lyr
_site_lyr_max_diff	= 40-- 不同资源最大层数 当玩家等级上限低于此值时 各层遭遇等级会对应压缩 以便玩家可进入此最大层数

loc_tp_map_infos={-- z_site_tp z_add_site.res z_pc_lv_max.site_lyr z_loc_map_gate
[loc_tp_tree_0	]={lmt_tree_0	,-1,-1},
[loc_tp_tree_1	]={lmt_tree_1	,-1,-1},
[loc_tp_tree_2	]={lmt_tree_2	,-1,-1},
[loc_tp_tree_3	]={lmt_tree_3	,-1,-1},
[loc_tp_rock_0	]={lmt_sandstone, 1,lmt_slate,6,lmt_limestone,11,lmt_marble,16,lmt_granite,21,lmt_basalt,26,lmt_quartzite,31,lmt_val_rock,36,_site_lyr_max},-- _site_lyr_max_diff
[loc_tp_rock_1	]={lmt_cmn_rock	, 1,_site_lyr_max},
[loc_tp_rock_2	]={lmt_val_rock	, 1,_site_lyr_max},
[loc_tp_rock_3	]={lmt_def		,-1,-1},
[loc_tp_mine_0	]={lmt_cpr		, 1,lmt_iron,6,lmt_slvr,11,lmt_gold,16,lmt_sp_metal,21,_site_lyr_max},
[loc_tp_mine_1	]={lmt_iron		, 1,_site_lyr_max},
[loc_tp_mine_2	]={lmt_val_metal, 1,_site_lyr_max},
[loc_tp_mine_3	]={lmt_sp_metal	, 1,_site_lyr_max},
[loc_tp_coal_0	]={lmt_coal		, 1,_site_lyr_max},
[loc_tp_coal_1	]={lmt_def		,-1,-1},
[loc_tp_coal_2	]={lmt_def		,-1,-1},
[loc_tp_coal_3	]={lmt_def		,-1,-1},
}


-- npc数据	npc data	z_npc
_npc_sup_max		= 80-- 向导最大补给率
_npc_wt_x			=  5-- 搬运工负重加成倍率
_npc_lockpick_div	=  5-- 每x锁匠等级 +1开锁器/周
_sag_up_div			= 10-- 每x贤者等级 提升1名雇员等级/周
_sag_xp_div			=  2-- 每x贤者等级 +1%队伍经验获得
_sag_xp_max			= 50-- 经验加成上限
_mk_potions_div		= 10-- 每x炼金等级 +1药剂/周	z_potion
_mk_potions_lvs		=  5-- 每x炼金等级 +1药剂单种和组
_mk_potion_grps_dec	= 12-- 药剂组产率递减


--[[
冒险事件 Adventure Event	奖励匹配的金币/魔法装备/藏宝图等
acts	可选动作 超4个则随机出3~4个
mons	战斗遭遇怪物组
flags	事件位标
time	耗时			默认1d4小时
fee		花费金币份额	默认0 淘货需100%
gp		奖励金币份额	默认100%
xp		奖励经验份额	默认100%
itm		好装率		默认100%=1件
itm2	差装率		默认25% 稀有度-1
map		藏宝图率		默认40%
]]
-- 事件位标	Event Flag
aef_fix_1	= 2^0-- 随机动作时必含首个且dc最低
-- 事件参数默认值
_ae_time	= 104-- 耗时
_ae_g		= 100-- 奖励金币份额
_ae_xp		= 100-- 奖励经验份额
_ae_itm		= 100-- 正装率
_ae_itm0	= 25 -- 差装率
_ae_itm1	= 25 -- 好装率
_ae_map		= 40 -- 藏宝图率
_ae_cs_dc1	= 1  -- 常识dc下限	common sense
_ae_cs_dc2	= 5  -- 常识dc上限
_ae_pct_x	= 10 -- 事件触发率倍数
_ae_gap_1	= 10 -- 事件触发初始最小间隔天数
_ae_gap		= 3	 -- 事件触发后续最小间隔天数

_adv_evts_db={-- z_adv_evt
[ae_fire	]={z="火灾",time=204	,acts=skl_survival},
[ae_rat		]={z="鼠虫",time=106	,acts={skl_survival,aea_rgr_drd}},
[ae_horse	]={z="惊马",time=101	,acts={skl_ride,skl_anim,skl_rope,aea_str,aea_rgr_drd}},
[ae_spell	]={z="法控"			,acts={skl_splcft,skl_umd,skl_k_arcana,skl_k_plane}},
[ae_thief	]={z="反扒"			,acts={skl_spot,skl_listen,skl_hand,aea_rog}},
[ae_cheat	]={z="反骗",time=101	,acts={skl_heal,skl_sense,skl_intimidate,skl_bluff}},
[ae_mediate	]={z="调解"			,acts={skl_sense,skl_diplomacy,skl_intimidate,skl_bluff}},
[ae_dun		]={z="讨债"			,acts={skl_diplomacy,skl_intimidate,skl_bluff,skl_disguise}},
[ae_detect	]={z="调查",time=208	,acts={skl_hand,skl_hide,skl_mov,skl_lock,skl_decipher,skl_forgery,skl_search,skl_spot,skl_listen,skl_diplomacy,skl_intimidate,skl_bluff,skl_disguise,skl_info,aea_lan}},
[ae_buy		]={z="淘货"			,acts={skl_lock,skl_disdev,skl_appraise,skl_decipher,skl_forgery,skl_splcft,skl_umd,skl_knowledge,aea_lan,aea_elf,aea_dwf,aea_rog},fee=100,g=0,itm=200,itm0=125,itm1=50,map=100},
[ae_perform	]={z="表演",time=206	,acts={skl_perform,skl_tumble,skl_balance,skl_esc,skl_hand,skl_ride,skl_disguise,skl_anim,aea_brd}	,flags=aef_fix_1},
[ae_jump	]={z="坍塌",time=101	,acts={skl_jump,skl_climb,skl_tumble,skl_balance,skl_esc,skl_rope,aea_str}							,flags=aef_fix_1},
[ae_climb	]={z="爬高"			,acts={skl_climb,skl_jump,skl_balance,skl_esc,skl_rope,skl_lock}									,flags=aef_fix_1},
[ae_swim	]={z="落水"			,acts={skl_swim,skl_climb,skl_jump,skl_balance,skl_rope,skl_disdev,aea_str,aea_wtr}					,flags=aef_fix_1},
[ae_monster	]={z="怪物"									,mons=_mon_grps	},
[ae_bandit	]={z="强盗"			,acts=skl_intimidate	,mons=mg_pc_race},
}
z_trm_cpy_subs(_adv_evts_text, _adv_evts_db)


-- 商业事件	Business Event
--[[
prf		利润检定修正
inc		利润检定修正累加（可负）
dur		持续月数 默认0=即时效果 1=仅本月 >1=数月 -1=永久 -2=特定条件结束
p2_prf	阶段2 ...
p2_inc	...
p2_dur	...
rpr		修缮费
loss	资产损失
ex_g	额外收益
mons	战斗遭遇怪物组
atk		事件发起者技能检定
acts	可选动作
flags	事件位标
]]
-- 事件位标	Event Flag
bef_good	= 2^0-- 有益
bef_no_eff	= 2^1-- 无影响
bef_ignore	= 2^2-- 忽略
bef_prf_3	= 2^3-- 连续盈利3次 以消除恶性竞争
bef_rfs_rep	= 2^4-- 拒绝则减声望
bef_ext_evt	= 2^5-- 败则额外不利事件
bef_1		= 2^6-- 某些持续性事件具有唯一性 若已发生并持续中 则不会重复发生 如雇员动乱
bef_act_1	= 2^7-- 某些持续性事件仅创建时需交互1次 如愤怒的顾客 默认创建/持续均交互 如鼠患虫灾
-- 事件动作	Event Action
bea_ndo		= -1-- 啥也不做
bea_rfs		= -2-- 拒绝
bea_atk		= -3-- 攻击
bea_hir		= -4-- 请人解决
bea_pay		= -5-- 花钱了事
bea_inv		= -6-- 投资
bea_prg		= -7-- 交保护费
bea_ras		= -8-- 加薪

-- 保护费额外不利事件 不可含保护费事件
_pr_ext_evts={
be_monster				,-- 怪物			
be_banditry				,-- 强盗			
be_wounded_adventurer	,-- 受伤的冒险者	
be_fire					,-- 火灾			
be_burglary				,-- 盗窃			
be_accident				,-- 事故			
be_irate_customer		,-- 愤怒的顾客		
be_bad_competition		,-- 恶性竞争		
be_infestation			,-- 鼠患虫灾		
be_employee_unrest		,-- 雇员动乱		
be_spell_gone_awry		,-- 法术失控		
be_sabotage				,-- 蓄意破坏		
be_unexpected_taxes		,-- 苛捐杂税		
}

_bus_evts_db={-- z_bus_evt
[be_monster				]={z="怪物			Monster				"			,rpr=50			,acts={bea_atk,bea_ndo}					,mons=_mon_grps					},-- cr=店主lv 袭击雇员、建筑 败则利润-6直到4d10x100修缮 z_bus_g
[be_banditry			]={z="强盗			Banditry			"			,rpr=10	,loss=30,acts={skl_intimidate,bea_atk,bea_hir}	,mons=mg_pc_race				},-- 小几率勒索保护费 大概率洗劫 暴徒总EL=店主lv-2
[be_wounded_adventurer	]={z="受伤的冒险者	Wounded Adventurer	"			,loss=30		,acts={skl_sense,skl_intimidate,bea_rfs}		,flags=bef_rfs_rep		},-- 或表里如一 或强盗/怪物前兆 或诈骗
[be_bad_weather			]={z="坏天气			Bad Weather			"			,rpr=20																					},-- 3d6×10修缮
[be_natural_disaster	]={z="自然灾害		Natural Disaster	",prf=-8	,dur=4	,inc=2																			},-- 重创企业 波及本地区所有人 利润-8 之后每月减值-2 直到4个月后影响消失
[be_fire				]={z="火灾			Fire				"			,rpr=30																					},-- 可能威胁整座城市 可能需店主参与扑救的森林级大火 或企业自身起火 可能纵火 若无人扑救则企业焚毁需重建
[be_burglary			]={z="盗窃			Burglary			"			,loss=30		,atk=skl_disdev															},-- 职业等级=店主lv-2 成功与否取决于店主设置的防御措施 若毫无防备 则盗取店内全部金币+2d6×100物资
[be_accident			]={z="事故			Accident			"			,rpr=20																					},-- 2d6×100修缮
[be_irate_customer		]={z="愤怒的顾客		Irate Customer		",prf=-4	,dur=204		,acts={skl_diplomacy,skl_intimidate,bea_pay}	,flags=bef_act_1		},-- 诉求或真或假 需立即应对 初始不友善 若未交涉/威吓/法术升至友善+ 顾客离去并在地区散播负面评价 2d4月利润-4
[be_no_encounter		]={z="没遭遇			No Encounter		"																			,flags=bef_ignore		},-- 无事件
[be_bad_competition		]={z="恶性竞争		Bad Competition		",prf=-106	,dur=-2															,flags=bef_prf_3		},-- 利润-d6 直到连续3月盈利	几乎相同服务 分流顾客并压价 怀恨在心 蓄意刁难 同为酒馆则雇德鲁伊制造鼠患 同为武馆则决斗作弊
[be_infestation			]={z="鼠患虫灾		Infestation			",prf=-1	,dur=-2	,inc=-1	,p2_inc=1,acts={skl_survival,bea_hir,bea_ndo}	,flags=bef_1			},-- 利润累计-1 dc25生存+2d6×10物资可除 或多次施放驱虫术等 成则每月减值-1
[be_employee_unrest		]={z="雇员动乱		Employee Unrest		",prf=-1	,dur=-2	,inc=-1	,acts={skl_diplomacy,bea_hir,bea_ras}			,flags=bef_1			},-- 利润累计-1 dc30交涉或加薪5 成则清0
[be_spell_gone_awry		]={z="法术失控		Spell Gone Awry		"			,rpr=20																					},-- 召唤生物 火球术 陷入混乱效果的城市卫队
[be_sabotage			]={z="蓄意破坏		Sabotage			",prf=-4	,dur=1			,atk=skl_disdev															},-- 恶意涂鸦~蓄意破坏 店主基础利润加值 对抗 破坏者解除装置 败则本月利润-4
[be_unexpected_taxes	]={z="苛捐杂税		Unexpected Taxes	",prf=-104	,dur=106																				},-- 财政困难 贪婪本性 1d6月利润-1d4
[be_protection_racket	]={z="保护费			Protection Racket	"			,dur=-2	,flags=bef_ext_evt,acts={skl_intimidate,bea_atk,bea_hir,bea_prg},mons=mg_pc_race},-- 每月3d6X10 拒缴且未灭之则每月+1次相关坏事件
[be_mistaken_identity	]={z="误认			Mistaken Identity	"					,flags=bef_no_eff																},-- DM可搞后续
[be_important_customer	]={z="重要顾客		Important Customer	",prf=2		,dur=104,flags=bef_good																	},-- 1d4月利润+2 可获盟友、联系人
[be_spectacle			]={z="娱乐活动		Spectacle			",prf=2		,dur=1	,flags=bef_good																	},-- 本月利润+2
[be_good_competition	]={z="良性竞争		Good Competition	",prf=-106	,dur=204,flags=bef_good,p2_prf=108,p2_dur=-1											},-- 2d4月利润-1d6 后永久+1d8
[be_booming_business	]={z="生意火爆		Booming Business	",prf=4		,dur=1	,flags=bef_good																	},-- 本月利润+4
[be_unusual_patron		]={z="不寻常的主顾	Unusual Patron		",prf=1		,dur=-1	,flags=bef_good																	},-- 永久利润+1 时长dm决定
[be_franchise_offer		]={z="特许专营		Franchise Offer		",prf=5		,dur=4	,inc=-1	,flags=bef_good + bef_act_1,p2_prf=1,p2_dur=-1,acts={bea_inv,bea_rfs}	},-- 每1k利润+5 每月-1 直至永久+1 在该国其他地区（城够大可同城）开设连锁店
[be_admirer				]={z="仰慕者			Admirer				",ex_g=100			,flags=bef_good																	},-- CR=业主等级-2 友善 提出委托 透露传闻 寻求友谊/建议
}
z_trm_cpy_subs(_bus_evts_text, _bus_evts_db)


-- 商业类型	Business Type
bf_mob		=    1-- 可行商	Mobile	z_bus_flags
bf_rel		= 2^20-- 每月+2d4点关系
bf_rep		= 2^21-- 每月+1声望

-- 产品
-- 农场
_prds_farm={
itm_wheat		,-- 小麦		
itm_flour		,-- 面粉		
itm_rice		,-- 大米			
itm_cabbages	,-- 卷心菜		
itm_carrots		,-- 胡萝卜	
itm_onions		,-- 洋葱		
itm_eggs		,-- 鸡蛋			
itm_chicken		,-- 鸡		
itm_goose		,-- 鹅		
itm_goat		,-- 山羊			
itm_sheep		,-- 绵羊		
itm_pig			,-- 猪		
itm_cow			,-- 奶牛		
itm_ox			,-- 肉牛		
}

-- 渔场
_prds_fish={
itm_salted_fish	,-- 咸鱼		
}

-- 狩猎营地
_prds_hunt={
itm_dried_meat	,-- 风干肉	
itm_partridge	,-- 山鹑		
itm_boar		,-- 野猪			
itm_hide		,-- 生皮			
itm_fur			,-- 毛皮		
}

-- 店铺
_prds_shop={
itm_salt		,-- 盐			
itm_sugar		,-- 糖		
itm_raisins		,-- 葡萄干	
itm_figs		,-- 无花果		
itm_nuts		,-- 坚果			
itm_butter		,-- 黄油		
itm_cheese		,-- 奶酪		
itm_olive_oil	,-- 橄榄油	
itm_honey		,-- 蜂蜜		
itm_herbs		,-- 香草		

itm_canvas		,-- 帆布		
itm_linen		,-- 亚麻布	
itm_woolens		,-- 毛料		
}

-- 商行
_prds_merc={
itm_cinnamon	,-- 肉桂			
itm_ginger		,-- 姜		
itm_pepper		,-- 胡椒		
itm_cloves		,-- 丁香		
itm_saffron		,-- 藏红花	

itm_silk		,-- 丝绸			
itm_velvet		,-- 天鹅绒	
}

-- 旅馆
_prds_tave={
itm_ale			,-- 麦酒		
itm_cider		,-- 苹果酒	
itm_wine		,-- 葡萄酒		
}

-- 制革厂
_prds_tnnr={
itm_leather		,-- 皮革		
itm_fine_fur	,-- 精制毛皮		
}


-- 锯木厂
_prds_wood={
itm_wood		,-- 木材			
itm_woodk		,-- 黒木		
}

-- 矿场
_prds_mine={
itm_iron		,-- 铁			
itm_copper		,-- 铜		
}

-- 钱庄
_prds_mone={
itm_silver		,-- 白银		
itm_gold		,-- 黄金			
itm_platinum	,-- 白金			
}

_bus_tps_db={-- z_bus_tp z_res_cap_rsk
[bus_tp_crim]={z="犯罪组织	Criminal Organization	",res=3,cap=4,rsk=3,flags=bf_rep					,skls={skl_intimidate	,skl_k_local	,skl_esc,skl_rope,skl_hand,skl_hide,skl_mov,skl_lock,skl_disdev,skl_forgery,skl_spot,skl_listen,skl_sense,skl_diplomacy,skl_bluff,skl_disguise,skl_info,skl_p_gambler,skl_p_ass,skl_p_spy,skl_p_thf}},-- z skl_esc... 3r skl_front
[bus_tp_figh]={z="斗士学校	Fighting School			",res=3,cap=1,rsk=2,flags=bf_rep					,skls={skl_bab			,skl_intimidate	,skl_c_wpn,skl_c_amr,skl_c_bow	,skl_c_bs,skl_p_soldier,skl_p_ass,skl_climb,skl_swim,skl_jump,skl_tumble,skl_balance,skl_esc,skl_ride}},
[bus_tp_univ]={z="大学		University				",res=2,cap=4,rsk=1,flags=bf_rep					,skls={skl_knowledge	,skl_diplomacy	,skl_p_tchr		,skl_knowledge,skl_lang,skl_decipher,skl_p_scribe,skl_p_lib,skl_p_sag,skl_c_cal,skl_c_paint,skl_c_sculpt}},
[bus_tp_perf]={z="演艺厅		Performance Hall		",res=2,cap=1,rsk=1,flags=bf_rel					,skls={skl_perform		,skl_diplomacy	,skl_sense		,skl_disguise,skl_lang,skl_perform,skl_k_nobility,skl_k_history,skl_k_religion,skl_p_min}},
[bus_tp_trou]={z="马戏团		Troupe					",res=1,cap=2,rsk=1,flags=bf_mob+bf_rel				,skls={skl_perform		,skl_perform	,skl_climb,skl_jump,skl_tumble,skl_balance,skl_esc,skl_hand,skl_ride,skl_disguise,skl_anim}},
[bus_tp_serv]={z="服务业		Service					",res=1,cap=2,rsk=1,flags=bf_mob+bf_rel				,skls={skl_profession	,skl_diplomacy	,skl_appraise	,skl_sense}},-- 3r skl_profession skl_craft
[bus_tp_crft]={z="工坊		Workshop				",res=1,cap=2,rsk=1,flags=bf_mob+bf_rel				,skls={skl_craft		,skl_diplomacy	,skl_appraise	}},
[bus_tp_shop]={z="店铺		Shop					",res=1,cap=2,rsk=3				,prds=_prds_shop	,skls={skl_p_bkkpr		,skl_appraise	,skl_sense		}},
[bus_tp_mone]={z="钱庄		Moneylender				",res=2,cap=2,rsk=2				,prds=_prds_mone	,skls={skl_p_bkkpr		,skl_diplomacy	,skl_appraise	,skl_sense,skl_intimidate,skl_bluff,skl_info,skl_k_local,skl_k_nobility,skl_p_merchant,skl_p_barr}},
[bus_tp_tave]={z="旅馆		Tavern					",res=2,cap=2,rsk=3				,prds=_prds_tave	,skls={skl_p_innkpr		,skl_sense		,skl_p_cook,skl_p_brewer	,skl_p_baker}},
[bus_tp_merc]={z="商行		Trading Company			",res=2,cap=4,rsk=2				,prds=_prds_merc	,skls={skl_p_merchant	,skl_diplomacy	,skl_appraise,skl_sense,skl_info,skl_k_local,skl_k_nobility}},
[bus_tp_farm]={z="农场		Farm					",res=1,cap=1,rsk=1				,prds=_prds_farm	,skls={skl_p_farm		,skl_k_nature	,skl_anim	,skl_p_herder,skl_p_anim,skl_p_porter,skl_p_lab}},-- z skl_p_herder...
[bus_tp_fish]={z="渔场		Fishery					",res=1,cap=2,rsk=1				,prds=_prds_fish	,skls={skl_p_fish		,skl_swim		,skl_rope,skl_k_nature,skl_p_sailor}},-- z add
[bus_tp_hunt]={z="狩猎营地	Hunting Camp			",res=1,cap=1,rsk=2,flags=bf_mob,prds=_prds_hunt	,skls={skl_p_hunt		,skl_survival	,skl_spot,skl_listen,skl_anim,skl_k_nature,skl_p_tanner,skl_c_bow,skl_c_trap,skl_climb,skl_swim,skl_jump,skl_tumble,skl_balance,skl_esc,skl_rope,skl_hide,skl_mov,skl_search}},
[bus_tp_tnnr]={z="制革厂		Tannery					",res=1,cap=1,rsk=1,flags=bf_mob,prds=_prds_tnnr	,skls={skl_p_tanner		,skl_c_lthr		,skl_p_hunt,skl_anim,skl_p_herder,skl_appraise}},
[bus_tp_lumb]={z="锯木厂		Sawmill					",res=1,cap=1,rsk=1				,prds=_prds_wood	,skls={skl_p_lumb		,skl_p_wood		,skl_c_carp,skl_p_porter,skl_p_lab}},
[bus_tp_mine]={z="矿场		Mine					",res=1,cap=2,rsk=3				,prds=_prds_mine	,skls={skl_p_mine		,skl_p_rock		,skl_c_stone,skl_p_porter,skl_p_lab,skl_c_bs,skl_appraise}},
[bus_tp_bsws]={z="铁匠铺		Smithy					",res=1,cap=1,rsk=1,flags=bf_mob,cft=it_wpn			,skls={skl_c_bs			,skl_p_mine		,skl_appraise,skl_p_rock,skl_c_wpn,skl_c_amr}},
[bus_tp_wpnw]={z="武器工坊	Weapon Smithy			",res=2,cap=2,rsk=2				,cft=it_wpn			,skls={skl_c_wpn		,skl_c_bs		,skl_appraise,skl_c_amr,skl_c_bow,skl_p_mine,skl_p_rock}},
[bus_tp_amrw]={z="防具工坊	Armor Smithy			",res=2,cap=2,rsk=2				,cft=it_amr			,skls={skl_c_amr		,skl_c_bs		,skl_appraise,skl_c_wpn,skl_p_mine,skl_p_rock}},
[bus_tp_maaw]={z="附魔工坊	Enchanting Workshop		",res=2,cap=4,rsk=2				,cft=it_magic_beqpt	,skls={skl_c_maa		,skl_diplomacy	,skl_appraise,skl_splcft,skl_umd,skl_k_arcana,skl_c_wond,skl_c_alchemy,skl_c_wpn,skl_c_amr}},
[bus_tp_wond]={z="奇物工坊	Wondrous Item Workshop	",res=2,cap=4,rsk=3				,cft=it_wond		,skls={skl_c_wond		,skl_diplomacy	,skl_appraise,skl_splcft,skl_umd,skl_k_arcana,skl_k_plane,skl_c_maa,skl_c_alchemy}},
[bus_tp_alch]={z="炼金工坊	Alchemy Workshop		",res=1,cap=2,rsk=3,flags=bf_mob,cft=it_potion		,skls={skl_c_alchemy	,skl_k_arcana	,skl_appraise,skl_splcft,skl_umd,skl_p_herb,skl_p_apo,skl_c_maa,skl_c_wond}},
}
z_trim_nds(_bus_tps_text)
z_cpy_nds(_bus_tps_db, _bus_tps_text)
--[[
联合工会 Associated Guild	
犯罪						
自然						
商会						
政府						
服务业						
宗教 服务业					
奥术 宗教 商业				
商业 服务业					
服务业						
奥术 宗教 学校				
]]

s_bus_stg_d		=xs_lbl("s_stg_nrm").._pm_n2..xs_lbl("s_stg_con")-- 经营策略描述
s_full_part_d	=xs_lbl("s_full_time").._pm_n2..xs_lbl("s_part_time")-- 全职或兼职描述
-- 商业帮助
s_buss_h		=s_buss_d.._pm_n3..-- 商业概述
xs_h2_k("s_bus_bsc"		).._pm_n3..-- 基础知识
xs_h2_k("s_bus_mk"		).._pm_n3..-- 创建商业
xs_h2_k("s_opr_loc"		).._pm_n3..-- 营业地点
xs_h2_k("s_bus_rsk"		).._pm_n3..-- 风险
xs_h2_k("s_prf_chk"		).._pm_n3..-- 利润检定
xs_h2_k("s_bus_stg"		).._pm_n3..-- 经营策略
xs_h2_k("s_top_cfg"		).._pm_n3..-- 最高配置
xs_h2_k("s_full_part"	).._pm_n3..-- 全职或兼职
xs_h2_k("s_bus_mob"		).._pm_n3..-- 行商
xs_h2_k("s_bus_upg"		).._pm_n3..-- 升级企业
xs_h2_k("s_exp_sz"		).._pm_n3..-- 扩大规模
xs_h2_k("s_spcs"		).._pm_n3..-- 专家
xs_h2_k("s_bus_evts"	)		   -- 商业事件


-- 冒险公会菜单功能
_feas_ag_menu={
fea_gp	,-- 金币
fea_mw	,-- 精制
fea_e0	,-- 魔法
fea_e1	,-- 稀有
fea_e2	,-- 罕见
fea_e3	,-- 史诗
fea_e4	,-- 传奇
fea_als	,-- 炼银
fea_mth	,-- 秘银
fea_adm	,-- 精金
fea_dkw	,-- 黒木
fea_up	,-- 升物
fea_pc	,-- 升人
fea_my	,-- 升队
fea_skl	,-- 技能
fea_exp	,-- 专家
}
-- 冒险百宝箱
_feas_kit={
fea_ret	,-- 回城
fea_out	,-- 出洞
fea_obj	,-- 传物
fea_dlv	,-- 传货
}
-- 宝库选项 选钱固定
_feas_er={
fea_mw	,-- 精制
fea_e0	,-- 魔法
fea_e1	,-- 稀有
fea_e2	,-- 罕见
}
-- 库二选项
_feas_er2={
fea_als	,-- 炼银
fea_mth	,-- 秘银
fea_adm	,-- 精金
fea_dkw	,-- 黒木
fea_up	,-- 升物
fea_pc	,-- 升人
fea_my	,-- 升队
fea_skl	,-- 技能
fea_exp	,-- 专家
}

-- z_fea_flag
ff_1	= 1-- 一过性发放 非每月 金币 史诗等
ff_inf	= 2-- 无限使用 使用次数始终1 不消耗
ff_rst	= 4-- 每月重置次数
ff_stk	= 8-- 每月累积次数

_fea_max_stk	= 6-- 最大累积次数

_feas_db={
[fea_er	]={o="bag_8"		,z="宝库"	,v=0		,f=ff_inf	},
[fea_gp	]={o="gold"			,z="金币"	,v=0		,f=ff_1		},
[fea_mw	]={o="eqpts_mw"		,z="精制"	,v=rl_mw	,f=ff_stk	},
[fea_e0	]={o="eqpts_e0"		,z="魔法"	,v=rl_e0	,f=ff_stk	},
[fea_e1	]={o="eqpts_e1"		,z="稀有"	,v=rl_e1	,f=ff_stk	,er_mod=1},
[fea_e2	]={o="eqpts_e2"		,z="罕见"	,v=rl_e2	,f=ff_stk	,er_mod=2},
[fea_e3	]={o="eqpts_e3"		,z="史诗"	,v=rl_e3	,f=ff_1		},
[fea_e4	]={o="eqpts_e4"		,z="传奇"	,v=rl_e4	,f=ff_1		},
[fea_als]={o="eqpts_im_alsv",z="炼银"	,v=im_alsv	,f=ff_stk	},
[fea_mth]={o="eqpts_im_mith",z="秘银"	,v=im_mith	,f=ff_stk	,er_mod=1},
[fea_adm]={o="eqpts_im_adam",z="精金"	,v=im_adam	,f=ff_stk	,er_mod=2},
[fea_dkw]={o="eqpts_im_dkwd",z="黒木"	,v=im_dkwd	,f=ff_stk	},
[fea_up	]={o="cft_up"		,z="升物"	,v=1		,f=ff_stk	},
[fea_pc	]={o="cft_up_pc"	,z="升人"	,v=1		,f=ff_stk	,er_mod=1},
[fea_my	]={o="cft_up_pty"	,z="升队"	,v=1		,f=ff_stk	,er_mod=2},
[fea_skl]={o="skls"			,z="技能"	,v=10		,f=ff_stk	},
[fea_exp]={o="pc_skl"		,z="专家"	,v=5		,f=ff_stk	},

[fea_ret]={o="fea_ret"		,z="回城"				,f=ff_rst	},
[fea_out]={o="fea_out"		,z="出洞"	,v=0		,f=ff_inf	},
[fea_obj]={o="fea_obj"		,z="传物"				,f=ff_rst	},
[fea_dlv]={o="fea_dlv"		,z="传货"	,v=50		,f=ff_rst	},

[fea_bpc]={o="pty_bk"		,z="队池"	},
[fea_rep]={o="rep"			,z="声望"	,v=1},
[fea_rel]={o="aid"			,z="关系"	,v=1},
[fea_mkt]={o="town_mkt"		,z="市场"	,v=1},
[fea_qst]={o="qst_4_0"		,z="月常"	,v=1},
[fea_bus]={o="bus_prf_bns"	,z="商业"	,v=1},
[fea_cft]={o="cft_64"		,z="制作"	,v=1},
[fea_wh ]={o="bag_wh_32"	,z="仓库"	},
}
z_trim_nds(_feas_text)
z_cpy_nds(_feas_db, _feas_text)
-- 会员装备（精制）... z_rare_lv
for _,i in pairs({fea_mw, fea_e0, fea_e1, fea_e2, fea_e3, fea_e4}) do
	_feas_db[i].n = s_fea_eqp.." ("..rare_lvs2[_feas_db[i].v].n..")"
	_feas_db[i].d = s_fea_eqp_d
end

-- 英雄遗产 Hero's Legacy
er_dgn	= 1-- z_er_tp
er_job	= 2
--[[
t	类型
num	需完成数量
mod	z_er_mod = rl mod
]]
_elt_rwds={
[ 0]={t=er_dgn,num=2,mod=0},
[ 1]={t=er_dgn,num=4,mod=1},
[ 2]={t=er_dgn,num=6,mod=2},
[ 3]={t=er_job,num=4,mod=0},
[ 4]={t=er_job,num=6,mod=1},
[ 5]={t=er_job,num=8,mod=2},
}

-- 冒险者名望等级 Adventurer Renown Level
_alvs_db={
[ 0]={z="见习"},
[ 1]={z="青铜",feas={fea_ret,1,fea_er ,1,fea_mw ,2										}},-- 1	精制	回城	宝库					
[ 2]={z="赤铁",feas={fea_out,1,fea_skl,1,fea_e0 ,2,fea_wh ,1								}},-- 2	魔法	出洞	技能	货仓				
[ 3]={z="精钢",feas={fea_mkt,1,fea_exp,1,fea_als,1,fea_gp ,10000					 		}},-- 3 市场	专家	金币	炼银				
[ 4]={z="白银",feas={fea_ret,1,fea_bus,1,fea_e1 ,1,fea_up ,2								}},-- 4	稀有	回城	商业		升物			
[ 5]={z="黄金",feas={fea_qst,1,fea_e3 ,1,fea_adm,1,fea_gp ,20000		,fea_rep,1			}},-- 5	声望	月常	金币	精金	史诗		
[ 6]={z="白金",feas={fea_bpc,1,fea_e3 ,1,fea_mth,1,fea_up ,1			,fea_e2 ,1,fea_bus,1}},-- 6 罕见	队池	商业	秘银	升物	史诗		
[ 7]={z="寒铁",feas={fea_ret,1,fea_e3 ,1,fea_dkw,1,fea_gp ,100000	,fea_obj,1,fea_cft,1}},-- 7	传物	回城	金币	黒木	制作	史诗		
[ 8]={z="秘银",feas={fea_dlv,1,fea_e3 ,1,fea_e4 ,1,fea_pc ,1			,fea_er ,1,fea_bus,1}},-- 8	传货	宝库	商业	传奇	升人	史诗		
[ 9]={z="精金",feas={fea_ret,1,fea_e3 ,1,fea_e4 ,1,fea_gp ,200000	,fea_obj,1,fea_cft,1}},-- 9 传物	回城	金币	传奇	制作	史诗		
[10]={z="恒金",feas={fea_dlv,1,fea_e3 ,1,fea_e4 ,1,fea_my ,1			,fea_rel,1,fea_bus,1}},--10	传货	关系	商业	传奇	升队	史诗		
}
z_trim_nds(_alvs_text)
z_cpy_nds(_alvs_db, _alvs_text)
_alvs_db[0].n = "<c=w>".._alvs_db[0].n.."</c>"-- 见习始终白色 其他显示黄色


-- 任务类型 z_qst_tp
qt_main	= 1-- 主线
qt_side	= 2-- 支线
qt_wqst	= 3-- 世界
qt_aqst	= 4-- 冒险月常

-- 任务位标 z_qst_flag
qf_alv	= 1-- 开启冒险者声望

_aqsts_upd_n=3-- 冒险月常刷新量

_qsts_db={
-- 主线
[101]={z="初来乍到", t=qt_main, f=qf_alv,		xp= 50,									ee=sf_adv,																						},
[102]={z="证明实力", t=qt_main, pre=101,			xp=100, axp=100, g=100, itms="eqp_cm_1",be=sf_adv,			do_wmons=3, do_jobs=3, has_rep=5,											},
[103]={z="地牢技能", t=qt_main, pre=102,			xp=150, axp=100, g=150, itms="eqp_cm_1",be=sf_adv,			has_itms="lockpick,10", has_skls={skl_lock,skl_disdev},						},-- thieves_tools
[104]={z="初次地牢", t=qt_main, pre=103,			xp=200, axp=200, g=200, itms="eqp_cm_1",be=sf_adv,			do_dgns=1,																	},
--[[ 支线
[401]={z="工匠求助", t=qt_side, req=104,	alv=2,	xp= 50, axp= 50, g= 50,					bb=sf_adv,ee=sf_cft,																			},
[402]={z="清资源点", t=qt_side, pre=401,			xp=150, axp=150, g=150,					be=sf_cft,			do_ress=3,																	},
[403]={z="采集原料", t=qt_side, pre=402,			xp=100, axp=100, g=100,					be=sf_cft,			has_itms="wood,10;sandstone,10;ore_cpr,10",									},
[404]={z="回家交差", t=qt_side, pre=403,			xp= 50, axp= 50, g= 50,					bb=sf_cft,ee=sf_adv,																			},
[405]={z="搞炭搞铁", t=qt_side, pre=404,	alv=3,	xp=150, axp=150, g=150,					be=sf_adv,			has_skls=skl_c_bs, has_itms="coke,5;bar_iron,5;bar_stl,5;gs_2,5",			},
[406]={z="制造装备", t=qt_side, pre=405,			xp=200, axp=200, g=200,					be=sf_adv,			has_skls={skl_c_wpn,skl_c_amr},has_itms="swd_t,2,mw;club_s,2,mw;shd1,2,mw",	},
]]
-- 月常	id对应z_qst_chk好改存档 实际可随意id
--[801]={z="剿灭怪物"
[802]={z="剿灭野怪", t=qt_aqst, req=104,			xp=200, axp=350, g=200, itms="eqp_rd_1",be=sf_adv,			do_wmons=5,																	},
[803]={z="清资源点", t=qt_aqst, req=104,			xp=150, axp=350, g=150, itms="eqp_rd_1",be=sf_adv,			do_ress=4,																	},
[804]={z="探索地牢", t=qt_aqst, req=104,			xp=300, axp=350, g=300, itms="eqp_rd_1",be=sf_adv,			do_dgns=3,																	},
[805]={z="城镇委托", t=qt_aqst, req=104,			xp=250, axp=350, g=250, itms="eqp_rd_1",be=sf_adv,			do_jobs=5,																	},
--[[
[806]={z="世界任务", t=qt_aqst, pre=101,			xp=200, axp=350, g=200, itms="rd_eqp_1",be=sf_adv,			do_wqsts=4,																	},
]]

[901]={z="救死扶伤", t=qt_wqst,					xp=200, axp=350, g=200, itms="eqp_rd_1",					do_wmons=5,	n="救死扶伤", d="救死扶伤。"										},

-- DeLastOne Adventure Quest Chain (Unlocks after Quest 103 - available immediately)
[2001]={z="DeLastOne - 瘟疫开始", t=qt_aqst, req=103,	xp=600, axp=400, g=300, itms="eqp_rd_1",be=sf_adv,			do_wmons=5,	n="DeLastOne - The Plague Begins", d="A mysterious plague has struck the lands near Yvesland. The sick are rising as undead! Defeat 5 undead creatures and discover clues about the source of this dark curse. Rumor speaks of an ancient temple..."				},
[2002]={z="DeLastOne - 暗影神殿", t=qt_aqst, req=103, pre=2001,	xp=900, axp=500, g=500, itms="eqp_rd_1",be=sf_adv,			do_dgns=1,	n="DeLastOne - Temple of Shadows", d="You've discovered the plague originates from a cursed temple. Necromancer Malachar is using 'The Last One' artifact to raise the dead. Enter the temple dungeon and stop him before his power grows unstoppable!"						},
[2003]={z="DeLastOne - 最终仪式", t=qt_aqst, req=103, pre=2002,	xp=1500, axp=600, g=1000, itms="eqp_rd_1",be=sf_adv,			do_wmons=8,	n="DeLastOne - The Final Ritual", d="Malachar escaped! He's performing the final ritual to unleash an undead army. Hunt down and destroy 8 of his corrupted followers before he completes the ceremony. The fate of the realm hangs in the balance!"				},
}
z_trm_cpy_subs(_qsts_text, _qsts_db)

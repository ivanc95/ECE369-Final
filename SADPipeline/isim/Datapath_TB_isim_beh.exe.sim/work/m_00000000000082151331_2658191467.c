/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x1cce1bb2 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/javila1/Desktop/SADPipeline/StorePartial.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {0, 0};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};



static void Always_9_0(char *t0)
{
    char t4[8];
    char t16[8];
    char t25[8];
    char t36[8];
    char t38[16];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t37;

LAB0:    t1 = (t0 + 3168U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(9, ng0);
    t2 = (t0 + 3488);
    *((int *)t2) = 1;
    t3 = (t0 + 3200);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(10, ng0);

LAB5:    xsi_set_current_line(12, ng0);
    t5 = (t0 + 1528U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 3U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 3U);
    t14 = (t0 + 2248);
    xsi_vlogvar_assign_value(t14, t4, 0, 0, 2);
    xsi_set_current_line(13, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t5 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 0);
    t10 = (t9 & 1);
    *((unsigned int *)t4) = t10;
    t11 = *((unsigned int *)t5);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    t6 = (t0 + 2088);
    xsi_vlogvar_assign_value(t6, t4, 0, 0, 1);
    xsi_set_current_line(15, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(24, ng0);

LAB18:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);

LAB19:    t6 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t5, 2, t6, 32);
    if (t15 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 32);
    if (t15 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 32);
    if (t15 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 32);
    if (t15 == 1)
        goto LAB26;

LAB27:
LAB29:
LAB28:    xsi_set_current_line(30, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB30:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(16, ng0);

LAB9:    xsi_set_current_line(17, ng0);
    t5 = (t0 + 2088);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);

LAB10:    t14 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t7, 1, t14, 32);
    if (t15 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t7, 1, t2, 32);
    if (t15 == 1)
        goto LAB13;

LAB14:
LAB16:
LAB15:    xsi_set_current_line(20, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB17:    goto LAB8;

LAB11:    xsi_set_current_line(18, ng0);
    t17 = (t0 + 1208U);
    t18 = *((char **)t17);
    memset(t16, 0, 8);
    t17 = (t16 + 4);
    t19 = (t18 + 4);
    t13 = *((unsigned int *)t18);
    t20 = (t13 >> 0);
    *((unsigned int *)t16) = t20;
    t21 = *((unsigned int *)t19);
    t22 = (t21 >> 0);
    *((unsigned int *)t17) = t22;
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 & 65535U);
    t24 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t24 & 65535U);
    t26 = (t0 + 1368U);
    t27 = *((char **)t26);
    memset(t25, 0, 8);
    t26 = (t25 + 4);
    t28 = (t27 + 4);
    t29 = *((unsigned int *)t27);
    t30 = (t29 >> 16);
    *((unsigned int *)t25) = t30;
    t31 = *((unsigned int *)t28);
    t32 = (t31 >> 16);
    *((unsigned int *)t26) = t32;
    t33 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t33 & 65535U);
    t34 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t34 & 65535U);
    xsi_vlogtype_concat(t4, 32, 32, 2U, t25, 16, t16, 16);
    t35 = (t0 + 1928);
    xsi_vlogvar_assign_value(t35, t4, 0, 0, 32);
    goto LAB17;

LAB13:    xsi_set_current_line(19, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t16, 0, 8);
    t3 = (t16 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t16) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 0);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t12 & 65535U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 65535U);
    t14 = (t0 + 1208U);
    t17 = *((char **)t14);
    memset(t25, 0, 8);
    t14 = (t25 + 4);
    t18 = (t17 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 0);
    *((unsigned int *)t25) = t21;
    t22 = *((unsigned int *)t18);
    t23 = (t22 >> 0);
    *((unsigned int *)t14) = t23;
    t24 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t24 & 65535U);
    t29 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t29 & 65535U);
    xsi_vlogtype_concat(t4, 32, 32, 2U, t25, 16, t16, 16);
    t19 = (t0 + 1928);
    xsi_vlogvar_assign_value(t19, t4, 0, 0, 32);
    goto LAB17;

LAB20:    xsi_set_current_line(26, ng0);
    t14 = (t0 + 1208U);
    t17 = *((char **)t14);
    memset(t16, 0, 8);
    t14 = (t16 + 4);
    t18 = (t17 + 4);
    t8 = *((unsigned int *)t17);
    t9 = (t8 >> 0);
    *((unsigned int *)t16) = t9;
    t10 = *((unsigned int *)t18);
    t11 = (t10 >> 0);
    *((unsigned int *)t14) = t11;
    t12 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t12 & 255U);
    t13 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t13 & 255U);
    t19 = (t0 + 1368U);
    t26 = *((char **)t19);
    memset(t25, 0, 8);
    t19 = (t25 + 4);
    t27 = (t26 + 4);
    t20 = *((unsigned int *)t26);
    t21 = (t20 >> 8);
    *((unsigned int *)t25) = t21;
    t22 = *((unsigned int *)t27);
    t23 = (t22 >> 8);
    *((unsigned int *)t19) = t23;
    t24 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t24 & 16777215U);
    t29 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t29 & 16777215U);
    xsi_vlogtype_concat(t4, 32, 32, 2U, t25, 24, t16, 8);
    t28 = (t0 + 1928);
    xsi_vlogvar_assign_value(t28, t4, 0, 0, 32);
    goto LAB30;

LAB22:    xsi_set_current_line(27, ng0);
    t3 = (t0 + 1368U);
    t6 = *((char **)t3);
    memset(t16, 0, 8);
    t3 = (t16 + 4);
    t14 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 0);
    *((unsigned int *)t16) = t9;
    t10 = *((unsigned int *)t14);
    t11 = (t10 >> 0);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t12 & 255U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 255U);
    t17 = (t0 + 1208U);
    t18 = *((char **)t17);
    memset(t25, 0, 8);
    t17 = (t25 + 4);
    t19 = (t18 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (t20 >> 0);
    *((unsigned int *)t25) = t21;
    t22 = *((unsigned int *)t19);
    t23 = (t22 >> 0);
    *((unsigned int *)t17) = t23;
    t24 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t24 & 255U);
    t29 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t29 & 255U);
    t26 = (t0 + 1368U);
    t27 = *((char **)t26);
    memset(t36, 0, 8);
    t26 = (t36 + 4);
    t28 = (t27 + 4);
    t30 = *((unsigned int *)t27);
    t31 = (t30 >> 16);
    *((unsigned int *)t36) = t31;
    t32 = *((unsigned int *)t28);
    t33 = (t32 >> 16);
    *((unsigned int *)t26) = t33;
    t34 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t34 & 65535U);
    t37 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t37 & 65535U);
    xsi_vlogtype_concat(t4, 32, 32, 3U, t36, 16, t25, 8, t16, 8);
    t35 = (t0 + 1928);
    xsi_vlogvar_assign_value(t35, t4, 0, 0, 32);
    goto LAB30;

LAB24:    xsi_set_current_line(28, ng0);
    t3 = (t0 + 1368U);
    t6 = *((char **)t3);
    memset(t16, 0, 8);
    t3 = (t16 + 4);
    t14 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 0);
    *((unsigned int *)t16) = t9;
    t10 = *((unsigned int *)t14);
    t11 = (t10 >> 0);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t12 & 65535U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 65535U);
    t17 = (t0 + 1208U);
    t18 = *((char **)t17);
    memset(t25, 0, 8);
    t17 = (t25 + 4);
    t19 = (t18 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (t20 >> 0);
    *((unsigned int *)t25) = t21;
    t22 = *((unsigned int *)t19);
    t23 = (t22 >> 0);
    *((unsigned int *)t17) = t23;
    t24 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t24 & 255U);
    t29 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t29 & 255U);
    t26 = (t0 + 1368U);
    t27 = *((char **)t26);
    memset(t36, 0, 8);
    t26 = (t36 + 4);
    t28 = (t27 + 4);
    t30 = *((unsigned int *)t27);
    t31 = (t30 >> 24);
    *((unsigned int *)t36) = t31;
    t32 = *((unsigned int *)t28);
    t33 = (t32 >> 24);
    *((unsigned int *)t26) = t33;
    t34 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t34 & 255U);
    t37 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t37 & 255U);
    xsi_vlogtype_concat(t4, 32, 32, 3U, t36, 8, t25, 8, t16, 16);
    t35 = (t0 + 1928);
    xsi_vlogvar_assign_value(t35, t4, 0, 0, 32);
    goto LAB30;

LAB26:    xsi_set_current_line(29, ng0);
    t3 = (t0 + 1368U);
    t6 = *((char **)t3);
    memset(t4, 0, 8);
    t3 = (t4 + 4);
    t14 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t14);
    t11 = (t10 >> 0);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 33554431U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 33554431U);
    t17 = (t0 + 1208U);
    t18 = *((char **)t17);
    memset(t16, 0, 8);
    t17 = (t16 + 4);
    t19 = (t18 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (t20 >> 0);
    *((unsigned int *)t16) = t21;
    t22 = *((unsigned int *)t19);
    t23 = (t22 >> 0);
    *((unsigned int *)t17) = t23;
    t24 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t24 & 255U);
    t29 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t29 & 255U);
    xsi_vlogtype_concat(t38, 33, 33, 2U, t16, 8, t4, 25);
    t26 = (t0 + 1928);
    xsi_vlogvar_assign_value(t26, t38, 0, 0, 32);
    goto LAB30;

}


extern void work_m_00000000000082151331_2658191467_init()
{
	static char *pe[] = {(void *)Always_9_0};
	xsi_register_didat("work_m_00000000000082151331_2658191467", "isim/Datapath_TB_isim_beh.exe.sim/work/m_00000000000082151331_2658191467.didat");
	xsi_register_executes(pe);
}

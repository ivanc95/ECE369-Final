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
static const char *ng0 = "C:/Users/javila1/Desktop/SADPipeline/LoadPartial.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {15, 0};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {65535U, 0U};
static int ng5[] = {7, 0};
static unsigned int ng6[] = {16777215U, 0U};



static void Always_8_0(char *t0)
{
    char t18[8];
    char t19[8];
    char t32[8];
    char t33[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    unsigned int t31;
    char *t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(8, ng0);
    t2 = (t0 + 3008);
    *((int *)t2) = 1;
    t3 = (t0 + 2720);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(9, ng0);

LAB5:    xsi_set_current_line(12, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(29, ng0);

LAB23:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB24;

LAB25:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1328U);
    t4 = (t2 + 72U);
    t5 = *((char **)t4);
    t11 = ((char*)((ng5)));
    xsi_vlog_generic_get_index_select_value(t18, 32, t3, t5, 2, t11, 32, 1);
    t12 = ((char*)((ng3)));
    memset(t19, 0, 8);
    t20 = (t18 + 4);
    t21 = (t12 + 4);
    t6 = *((unsigned int *)t18);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t20);
    t10 = *((unsigned int *)t21);
    t13 = (t9 ^ t10);
    t14 = (t8 | t13);
    t15 = *((unsigned int *)t20);
    t16 = *((unsigned int *)t21);
    t17 = (t15 | t16);
    t23 = (~(t17));
    t24 = (t14 & t23);
    if (t24 != 0)
        goto LAB31;

LAB28:    if (t17 != 0)
        goto LAB30;

LAB29:    *((unsigned int *)t19) = 1;

LAB31:    t29 = (t19 + 4);
    t25 = *((unsigned int *)t29);
    t26 = (~(t25));
    t27 = *((unsigned int *)t19);
    t28 = (t27 & t26);
    t31 = (t28 != 0);
    if (t31 > 0)
        goto LAB32;

LAB33:    xsi_set_current_line(40, ng0);

LAB36:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t19, 0, 8);
    t2 = (t19 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    *((unsigned int *)t19) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t10 & 255U);
    t13 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t13 & 255U);
    t5 = ((char*)((ng1)));
    xsi_vlogtype_concat(t18, 32, 32, 2U, t5, 24, t19, 8);
    t11 = (t0 + 1768);
    xsi_vlogvar_assign_value(t11, t18, 0, 0, 32);

LAB34:
LAB26:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(13, ng0);

LAB9:    xsi_set_current_line(15, ng0);
    t11 = (t0 + 1208U);
    t12 = *((char **)t11);
    t11 = (t12 + 4);
    t13 = *((unsigned int *)t11);
    t14 = (~(t13));
    t15 = *((unsigned int *)t12);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1328U);
    t4 = (t2 + 72U);
    t5 = *((char **)t4);
    t11 = ((char*)((ng2)));
    xsi_vlog_generic_get_index_select_value(t18, 32, t3, t5, 2, t11, 32, 1);
    t12 = ((char*)((ng3)));
    memset(t19, 0, 8);
    t20 = (t18 + 4);
    t21 = (t12 + 4);
    t6 = *((unsigned int *)t18);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t20);
    t10 = *((unsigned int *)t21);
    t13 = (t9 ^ t10);
    t14 = (t8 | t13);
    t15 = *((unsigned int *)t20);
    t16 = *((unsigned int *)t21);
    t17 = (t15 | t16);
    t23 = (~(t17));
    t24 = (t14 & t23);
    if (t24 != 0)
        goto LAB17;

LAB14:    if (t17 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t19) = 1;

LAB17:    t29 = (t19 + 4);
    t25 = *((unsigned int *)t29);
    t26 = (~(t25));
    t27 = *((unsigned int *)t19);
    t28 = (t27 & t26);
    t31 = (t28 != 0);
    if (t31 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(24, ng0);

LAB22:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t19, 0, 8);
    t2 = (t19 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    *((unsigned int *)t19) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t10 & 65535U);
    t13 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t13 & 65535U);
    t5 = ((char*)((ng1)));
    xsi_vlogtype_concat(t18, 32, 32, 2U, t5, 16, t19, 16);
    t11 = (t0 + 1768);
    xsi_vlogvar_assign_value(t11, t18, 0, 0, 32);

LAB20:
LAB12:    goto LAB8;

LAB10:    xsi_set_current_line(16, ng0);

LAB13:    xsi_set_current_line(17, ng0);
    t20 = (t0 + 1368U);
    t21 = *((char **)t20);
    memset(t19, 0, 8);
    t20 = (t19 + 4);
    t22 = (t21 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (t23 >> 0);
    *((unsigned int *)t19) = t24;
    t25 = *((unsigned int *)t22);
    t26 = (t25 >> 0);
    *((unsigned int *)t20) = t26;
    t27 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t27 & 65535U);
    t28 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t28 & 65535U);
    t29 = ((char*)((ng1)));
    xsi_vlogtype_concat(t18, 32, 32, 2U, t29, 16, t19, 16);
    t30 = (t0 + 1768);
    xsi_vlogvar_assign_value(t30, t18, 0, 0, 32);
    goto LAB12;

LAB16:    t22 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(20, ng0);

LAB21:    xsi_set_current_line(21, ng0);
    t30 = (t0 + 1368U);
    t34 = *((char **)t30);
    memset(t33, 0, 8);
    t30 = (t33 + 4);
    t35 = (t34 + 4);
    t36 = *((unsigned int *)t34);
    t37 = (t36 >> 0);
    *((unsigned int *)t33) = t37;
    t38 = *((unsigned int *)t35);
    t39 = (t38 >> 0);
    *((unsigned int *)t30) = t39;
    t40 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t40 & 65535U);
    t41 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t41 & 65535U);
    t42 = ((char*)((ng4)));
    xsi_vlogtype_concat(t32, 32, 32, 2U, t42, 16, t33, 16);
    t43 = (t0 + 1768);
    xsi_vlogvar_assign_value(t43, t32, 0, 0, 32);
    goto LAB20;

LAB24:    xsi_set_current_line(32, ng0);

LAB27:    xsi_set_current_line(33, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    memset(t19, 0, 8);
    t4 = (t19 + 4);
    t11 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t14 = (t13 >> 0);
    *((unsigned int *)t19) = t14;
    t15 = *((unsigned int *)t11);
    t16 = (t15 >> 0);
    *((unsigned int *)t4) = t16;
    t17 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t17 & 255U);
    t23 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t23 & 255U);
    t12 = ((char*)((ng1)));
    xsi_vlogtype_concat(t18, 32, 32, 2U, t12, 24, t19, 8);
    t20 = (t0 + 1768);
    xsi_vlogvar_assign_value(t20, t18, 0, 0, 32);
    goto LAB26;

LAB30:    t22 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB31;

LAB32:    xsi_set_current_line(36, ng0);

LAB35:    xsi_set_current_line(37, ng0);
    t30 = (t0 + 1368U);
    t34 = *((char **)t30);
    memset(t33, 0, 8);
    t30 = (t33 + 4);
    t35 = (t34 + 4);
    t36 = *((unsigned int *)t34);
    t37 = (t36 >> 0);
    *((unsigned int *)t33) = t37;
    t38 = *((unsigned int *)t35);
    t39 = (t38 >> 0);
    *((unsigned int *)t30) = t39;
    t40 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t40 & 255U);
    t41 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t41 & 255U);
    t42 = ((char*)((ng6)));
    xsi_vlogtype_concat(t32, 32, 32, 2U, t42, 24, t33, 8);
    t43 = (t0 + 1768);
    xsi_vlogvar_assign_value(t43, t32, 0, 0, 32);
    goto LAB34;

}


extern void work_m_00000000002377258208_0955276833_init()
{
	static char *pe[] = {(void *)Always_8_0};
	xsi_register_didat("work_m_00000000002377258208_0955276833", "isim/Datapath_TB_isim_beh.exe.sim/work/m_00000000002377258208_0955276833.didat");
	xsi_register_executes(pe);
}

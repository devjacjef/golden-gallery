#include <linux/module.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Jack Jefferson");
MODULE_DESCRIPTION("A kernel module for the golden gallery device code.");
MODULE_VERSION("0.2");

static int __init gg_init(void){
	printk(KERN_INFO "Golden Gallery has loaded, unleash the sunshine!\n");
	return 0;
}

static void __exit gg_exit(void){
	printk(KERN_INFO "Golden Gallery has unloaded, suppress the sunshine!\n");
}

module_init(gg_init);
module_exit(gg_exit);

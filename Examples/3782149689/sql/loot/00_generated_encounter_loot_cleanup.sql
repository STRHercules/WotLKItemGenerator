-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3100000, 3100001, 3100002, 3100004, 3100005, 3100006) OR `Reference` IN (3100000, 3100001, 3100002, 3100004, 3100005, 3100006);
DELETE FROM `creature_loot_template` WHERE `Entry` = 3914 AND `Item` = 1 AND `Reference` = 3100000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3886 AND `Item` = 1 AND `Reference` = 3100001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3887 AND `Item` = 1 AND `Reference` = 3100002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4279 AND `Item` = 1 AND `Reference` = 3100004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4274 AND `Item` = 1 AND `Reference` = 3100005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3927 AND `Item` = 1 AND `Reference` = 3100006;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3110000, 3110001) OR `Reference` IN (3110000, 3110001);
DELETE FROM `creature_loot_template` WHERE `Entry` = 1666 AND `Item` = 1 AND `Reference` = 3110000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 1706 AND `Item` = 1 AND `Reference` = 3110001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 1707 AND `Item` = 1 AND `Reference` = 3110001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 1708 AND `Item` = 1 AND `Reference` = 3110001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 1711 AND `Item` = 1 AND `Reference` = 3110001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 1715 AND `Item` = 1 AND `Reference` = 3110001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 1720 AND `Item` = 1 AND `Reference` = 3110001;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3120000, 3120001, 3120002, 3120003, 3120005, 3120006) OR `Reference` IN (3120000, 3120001, 3120002, 3120003, 3120005, 3120006);
DELETE FROM `creature_loot_template` WHERE `Entry` = 644 AND `Item` = 1 AND `Reference` = 3120000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 598 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 622 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 634 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 636 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 641 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 642 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 657 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 1725 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 1729 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 1731 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 1732 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3586 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3947 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4416 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4417 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4418 AND `Item` = 1 AND `Reference` = 3120001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 1763 AND `Item` = 1 AND `Reference` = 3120002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 646 AND `Item` = 1 AND `Reference` = 3120003;
DELETE FROM `creature_loot_template` WHERE `Entry` = 647 AND `Item` = 1 AND `Reference` = 3120005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 639 AND `Item` = 1 AND `Reference` = 3120006;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3130000, 3130001, 3130002, 3130003, 3130004, 3130005, 3130006, 3130007) OR `Reference` IN (3130000, 3130001, 3130002, 3130003, 3130004, 3130005, 3130006, 3130007);
DELETE FROM `creature_loot_template` WHERE `Entry` = 3671 AND `Item` = 1 AND `Reference` = 3130000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3840 AND `Item` = 1 AND `Reference` = 3130001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5912 AND `Item` = 1 AND `Reference` = 3130001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3669 AND `Item` = 1 AND `Reference` = 3130002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3653 AND `Item` = 1 AND `Reference` = 3130003;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3670 AND `Item` = 1 AND `Reference` = 3130004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3674 AND `Item` = 1 AND `Reference` = 3130005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3673 AND `Item` = 1 AND `Reference` = 3130006;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5775 AND `Item` = 1 AND `Reference` = 3130007;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3140000, 3140001, 3140002, 3140003, 3140004, 3140005, 3140006) OR `Reference` IN (3140000, 3140001, 3140002, 3140003, 3140004, 3140005, 3140006);
DELETE FROM `creature_loot_template` WHERE `Entry` = 6168 AND `Item` = 1 AND `Reference` = 3140000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4425 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4427 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4435 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4436 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4437 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4438 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4440 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4442 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4511 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4512 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4514 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4515 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4516 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4517 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4518 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4519 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4520 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4522 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4523 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4525 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4530 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4531 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4532 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4538 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4541 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4623 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4842 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6035 AND `Item` = 1 AND `Reference` = 3140001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4424 AND `Item` = 1 AND `Reference` = 3140002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4428 AND `Item` = 1 AND `Reference` = 3140003;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4420 AND `Item` = 1 AND `Reference` = 3140004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4421 AND `Item` = 1 AND `Reference` = 3140005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4422 AND `Item` = 1 AND `Reference` = 3140006;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3150000, 3150001, 3150002, 3150003, 3150004, 3150005, 3150006, 3150007) OR `Reference` IN (3150000, 3150001, 3150002, 3150003, 3150004, 3150005, 3150006, 3150007);
DELETE FROM `creature_loot_template` WHERE `Entry` = 4887 AND `Item` = 1 AND `Reference` = 3150000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4798 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4799 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4805 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4807 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4809 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4810 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4811 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4812 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4813 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4814 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4815 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4818 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4819 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4820 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4821 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4822 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4823 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4824 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4825 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4827 AND `Item` = 1 AND `Reference` = 3150001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4831 AND `Item` = 1 AND `Reference` = 3150002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6243 AND `Item` = 1 AND `Reference` = 3150003;
DELETE FROM `creature_loot_template` WHERE `Entry` = 12902 AND `Item` = 1 AND `Reference` = 3150004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4830 AND `Item` = 1 AND `Reference` = 3150005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4832 AND `Item` = 1 AND `Reference` = 3150006;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4829 AND `Item` = 1 AND `Reference` = 3150007;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3160000, 3160001, 3160002, 3160003, 3160004, 3160005, 3160006) OR `Reference` IN (3160000, 3160001, 3160002, 3160003, 3160004, 3160005, 3160006);
DELETE FROM `creature_loot_template` WHERE `Entry` = 6910 AND `Item` = 1 AND `Reference` = 3160000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4847 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4848 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4849 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4850 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4851 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4852 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4853 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4855 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4860 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4861 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4863 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6907 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6908 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7012 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7022 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7023 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7030 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7175 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7290 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7320 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7321 AND `Item` = 1 AND `Reference` = 3160001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6906 AND `Item` = 1 AND `Reference` = 3160002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7228 AND `Item` = 1 AND `Reference` = 3160003;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7206 AND `Item` = 1 AND `Reference` = 3160004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7291 AND `Item` = 1 AND `Reference` = 3160005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4854 AND `Item` = 1 AND `Reference` = 3160006;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3170000, 3170001, 3170002, 3170003) OR `Reference` IN (3170000, 3170001, 3170002, 3170003);
DELETE FROM `creature_loot_template` WHERE `Entry` = 7079 AND `Item` = 1 AND `Reference` = 3170000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6206 AND `Item` = 1 AND `Reference` = 3170001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6207 AND `Item` = 1 AND `Reference` = 3170001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6211 AND `Item` = 1 AND `Reference` = 3170001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6224 AND `Item` = 1 AND `Reference` = 3170001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6228 AND `Item` = 1 AND `Reference` = 3170001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6329 AND `Item` = 1 AND `Reference` = 3170001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6392 AND `Item` = 1 AND `Reference` = 3170001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6407 AND `Item` = 1 AND `Reference` = 3170001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7603 AND `Item` = 1 AND `Reference` = 3170001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7849 AND `Item` = 1 AND `Reference` = 3170001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6235 AND `Item` = 1 AND `Reference` = 3170002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6229 AND `Item` = 1 AND `Reference` = 3170003;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3180000, 3180001, 3180002, 3180004, 3180007) OR `Reference` IN (3180000, 3180001, 3180002, 3180004, 3180007);
DELETE FROM `creature_loot_template` WHERE `Entry` = 8580 AND `Item` = 1 AND `Reference` = 3180000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5226 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5228 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5256 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5259 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5263 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5267 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5269 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5270 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5271 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5273 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5277 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5280 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5283 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5291 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5708 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5711 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5712 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5713 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5714 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5715 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5716 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5717 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8319 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8384 AND `Item` = 1 AND `Reference` = 3180001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5721 AND `Item` = 1 AND `Reference` = 3180002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5710 AND `Item` = 1 AND `Reference` = 3180004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5709 AND `Item` = 1 AND `Reference` = 3180007;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3190000, 3190001, 3190002, 3190003) OR `Reference` IN (3190000, 3190001, 3190002, 3190003);
DELETE FROM `creature_loot_template` WHERE `Entry` = 7357 AND `Item` = 1 AND `Reference` = 3190000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7327 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7328 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7329 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7332 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7335 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7337 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7341 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7342 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7345 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7347 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7348 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7352 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7353 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7354 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 14686 AND `Item` = 1 AND `Reference` = 3190001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8567 AND `Item` = 1 AND `Reference` = 3190002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7358 AND `Item` = 1 AND `Reference` = 3190003;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3200000, 3200001, 3200002, 3200003, 3200004, 3200005, 3200006, 3200007) OR `Reference` IN (3200000, 3200001, 3200002, 3200003, 3200004, 3200005, 3200006, 3200007);
DELETE FROM `creature_loot_template` WHERE `Entry` = 3983 AND `Item` = 1 AND `Reference` = 3200000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3976 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4283 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4286 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4287 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4288 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4290 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4291 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4292 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4293 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4295 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4296 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4297 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4298 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4299 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4301 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4302 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4304 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4306 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4308 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4540 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6426 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6427 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6488 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6489 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6490 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 14693 AND `Item` = 1 AND `Reference` = 3200001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4543 AND `Item` = 1 AND `Reference` = 3200002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3974 AND `Item` = 1 AND `Reference` = 3200003;
DELETE FROM `creature_loot_template` WHERE `Entry` = 6487 AND `Item` = 1 AND `Reference` = 3200004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3975 AND `Item` = 1 AND `Reference` = 3200005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 4542 AND `Item` = 1 AND `Reference` = 3200006;
DELETE FROM `creature_loot_template` WHERE `Entry` = 3977 AND `Item` = 1 AND `Reference` = 3200007;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3210000, 3210001, 3210002, 3210003, 3210004, 3210005) OR `Reference` IN (3210000, 3210001, 3210002, 3210003, 3210004, 3210005);
DELETE FROM `creature_loot_template` WHERE `Entry` = 7795 AND `Item` = 1 AND `Reference` = 3210000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5648 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5649 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 5650 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7246 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7247 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7268 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7274 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7604 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7605 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7606 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7608 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7797 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8095 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8120 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10080 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10081 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10082 AND `Item` = 1 AND `Reference` = 3210001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8127 AND `Item` = 1 AND `Reference` = 3210002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7272 AND `Item` = 1 AND `Reference` = 3210003;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7271 AND `Item` = 1 AND `Reference` = 3210004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7267 AND `Item` = 1 AND `Reference` = 3210005;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3220000, 3220001, 3220002, 3220003, 3220004, 3220005, 3220006, 3220007, 3220008) OR `Reference` IN (3220000, 3220001, 3220002, 3220003, 3220004, 3220005, 3220006, 3220007, 3220008);
DELETE FROM `creature_loot_template` WHERE `Entry` = 9196 AND `Item` = 1 AND `Reference` = 3220000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9096 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9097 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9098 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9197 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9216 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9217 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9218 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9219 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9239 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9240 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9241 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9257 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9258 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9259 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9260 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9261 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9262 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9263 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9264 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9265 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9266 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9267 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9268 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9269 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9583 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9596 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9692 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9693 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9716 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9717 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9718 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9817 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9818 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9819 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10083 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10263 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10317 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10318 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10319 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10366 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10372 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10374 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10376 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10447 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10509 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10762 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10814 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10899 AND `Item` = 1 AND `Reference` = 3220001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9236 AND `Item` = 1 AND `Reference` = 3220002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9237 AND `Item` = 1 AND `Reference` = 3220003;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10596 AND `Item` = 1 AND `Reference` = 3220004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9736 AND `Item` = 1 AND `Reference` = 3220005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10220 AND `Item` = 1 AND `Reference` = 3220006;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9568 AND `Item` = 1 AND `Reference` = 3220007;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9816 AND `Item` = 1 AND `Reference` = 3220008;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3230000, 3230001, 3230002, 3230003, 3230004, 3230005, 3230007, 3230008, 3230009, 3230010, 3230012, 3230014, 3230015, 3230016) OR `Reference` IN (3230000, 3230001, 3230002, 3230003, 3230004, 3230005, 3230007, 3230008, 3230009, 3230010, 3230012, 3230014, 3230015, 3230016);
DELETE FROM `creature_loot_template` WHERE `Entry` = 9018 AND `Item` = 1 AND `Reference` = 3230000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8891 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8892 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8893 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8894 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8895 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8897 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8898 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8899 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8903 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8905 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8906 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8907 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8908 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8909 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8910 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8911 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8912 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8914 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8923 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8929 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9042 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9541 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9545 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9554 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9680 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9681 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10043 AND `Item` = 1 AND `Reference` = 3230001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9025 AND `Item` = 1 AND `Reference` = 3230002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9319 AND `Item` = 1 AND `Reference` = 3230003;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9024 AND `Item` = 1 AND `Reference` = 3230004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9017 AND `Item` = 1 AND `Reference` = 3230005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9056 AND `Item` = 1 AND `Reference` = 3230007;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9016 AND `Item` = 1 AND `Reference` = 3230008;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9033 AND `Item` = 1 AND `Reference` = 3230009;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8983 AND `Item` = 1 AND `Reference` = 3230010;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9502 AND `Item` = 1 AND `Reference` = 3230012;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9156 AND `Item` = 1 AND `Reference` = 3230014;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9938 AND `Item` = 1 AND `Reference` = 3230015;
DELETE FROM `creature_loot_template` WHERE `Entry` = 9019 AND `Item` = 1 AND `Reference` = 3230016;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3240000) OR `Reference` IN (3240000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 36538 AND `Item` = 1 AND `Reference` = 3240000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3250000, 3250001, 3250002, 3250003, 3250004, 3250006, 3250012) OR `Reference` IN (3250000, 3250001, 3250002, 3250003, 3250004, 3250006, 3250012);
DELETE FROM `creature_loot_template` WHERE `Entry` = 10503 AND `Item` = 1 AND `Reference` = 3250000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10469 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10470 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10471 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10476 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10477 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10478 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10481 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10486 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10487 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10488 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10489 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10491 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10495 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10498 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10499 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10500 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11257 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11551 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11582 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 14695 AND `Item` = 1 AND `Reference` = 3250001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11622 AND `Item` = 1 AND `Reference` = 3250002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10433 AND `Item` = 1 AND `Reference` = 3250003;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10432 AND `Item` = 1 AND `Reference` = 3250004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10505 AND `Item` = 1 AND `Reference` = 3250006;
DELETE FROM `creature_loot_template` WHERE `Entry` = 1853 AND `Item` = 1 AND `Reference` = 3250012;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3270000, 3270001, 3270002, 3270003, 3270004, 3270005, 3270006, 3270007, 3270009, 3270010, 3270013) OR `Reference` IN (3270000, 3270001, 3270002, 3270003, 3270004, 3270005, 3270006, 3270007, 3270009, 3270010, 3270013);
DELETE FROM `creature_loot_template` WHERE `Entry` = 10516 AND `Item` = 1 AND `Reference` = 3270000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10381 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10382 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10384 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10385 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10390 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10391 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10393 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10398 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10399 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10400 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10405 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10406 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10407 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10408 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10409 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10412 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10413 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10414 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10416 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10417 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10418 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10419 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10420 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10421 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10422 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10423 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10424 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10425 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10426 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10463 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10464 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10809 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11043 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 14684 AND `Item` = 1 AND `Reference` = 3270001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10558 AND `Item` = 1 AND `Reference` = 3270002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10808 AND `Item` = 1 AND `Reference` = 3270003;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10997 AND `Item` = 1 AND `Reference` = 3270004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11032 AND `Item` = 1 AND `Reference` = 3270005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10811 AND `Item` = 1 AND `Reference` = 3270006;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10436 AND `Item` = 1 AND `Reference` = 3270007;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10438 AND `Item` = 1 AND `Reference` = 3270009;
DELETE FROM `creature_loot_template` WHERE `Entry` = 10435 AND `Item` = 1 AND `Reference` = 3270010;
DELETE FROM `gameobject_loot_template` WHERE `Entry` = 17919 AND `Item` = 1 AND `Reference` = 3270013;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3280000, 3280003, 3280004, 3280005, 3280008) OR `Reference` IN (3280000, 3280003, 3280004, 3280005, 3280008);
DELETE FROM `creature_loot_template` WHERE `Entry` = 13282 AND `Item` = 1 AND `Reference` = 3280000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 12236 AND `Item` = 1 AND `Reference` = 3280003;
DELETE FROM `creature_loot_template` WHERE `Entry` = 12225 AND `Item` = 1 AND `Reference` = 3280004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 12203 AND `Item` = 1 AND `Reference` = 3280005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 12201 AND `Item` = 1 AND `Reference` = 3280008;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3290000) OR `Reference` IN (3290000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 11520 AND `Item` = 1 AND `Reference` = 3290000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3310000, 3310001, 3310004, 3310005, 3310006, 3310008, 3310010, 3310011, 3310013) OR `Reference` IN (3310000, 3310001, 3310004, 3310005, 3310006, 3310008, 3310010, 3310011, 3310013);
DELETE FROM `creature_loot_template` WHERE `Entry` = 11490 AND `Item` = 1 AND `Reference` = 3310000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11451 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11452 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11453 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11454 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11455 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11456 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11457 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11458 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11459 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11462 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11464 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11467 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11469 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11470 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11471 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11472 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11473 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11475 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11480 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11483 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11484 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 13021 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 13036 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 13196 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 14303 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 14349 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 14398 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 14399 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 14690 AND `Item` = 1 AND `Reference` = 3310001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11492 AND `Item` = 1 AND `Reference` = 3310004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11488 AND `Item` = 1 AND `Reference` = 3310005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11487 AND `Item` = 1 AND `Reference` = 3310006;
DELETE FROM `creature_loot_template` WHERE `Entry` = 11489 AND `Item` = 1 AND `Reference` = 3310008;
DELETE FROM `creature_loot_template` WHERE `Entry` = 14326 AND `Item` = 1 AND `Reference` = 3310010;
DELETE FROM `creature_loot_template` WHERE `Entry` = 14321 AND `Item` = 1 AND `Reference` = 3310011;
DELETE FROM `creature_loot_template` WHERE `Entry` = 14325 AND `Item` = 1 AND `Reference` = 3310013;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3340007) OR `Reference` IN (3340007);
DELETE FROM `creature_loot_template` WHERE `Entry` = 15727 AND `Item` = 1 AND `Reference` = 3340007;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3360005, 3360013) OR `Reference` IN (3360005, 3360013);
DELETE FROM `creature_loot_template` WHERE `Entry` = 16011 AND `Item` = 1 AND `Reference` = 3360005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 15990 AND `Item` = 1 AND `Reference` = 3360013;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3370000) OR `Reference` IN (3370000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 29249 AND `Item` = 1 AND `Reference` = 3370000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3390000) OR `Reference` IN (3390000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 16807 AND `Item` = 1 AND `Reference` = 3390000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3400000) OR `Reference` IN (3400000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 20568 AND `Item` = 1 AND `Reference` = 3400000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3420002) OR `Reference` IN (3420002);
DELETE FROM `creature_loot_template` WHERE `Entry` = 18607 AND `Item` = 1 AND `Reference` = 3420002;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3440001) OR `Reference` IN (3440001);
DELETE FROM `creature_loot_template` WHERE `Entry` = 18433 AND `Item` = 1 AND `Reference` = 3440001;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3460000, 3460001) OR `Reference` IN (3460000, 3460001);
DELETE FROM `creature_loot_template` WHERE `Entry` = 17797 AND `Item` = 1 AND `Reference` = 3460000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 17796 AND `Item` = 1 AND `Reference` = 3460001;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3470000, 3470001) OR `Reference` IN (3470000, 3470001);
DELETE FROM `creature_loot_template` WHERE `Entry` = 20629 AND `Item` = 1 AND `Reference` = 3470000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 20630 AND `Item` = 1 AND `Reference` = 3470001;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3520000, 3520001, 3520002, 3520003) OR `Reference` IN (3520000, 3520001, 3520002, 3520003);
DELETE FROM `creature_loot_template` WHERE `Entry` = 21216 AND `Item` = 1 AND `Reference` = 3520000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 21215 AND `Item` = 1 AND `Reference` = 3520001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 21214 AND `Item` = 1 AND `Reference` = 3520002;
DELETE FROM `creature_loot_template` WHERE `Entry` = 21213 AND `Item` = 1 AND `Reference` = 3520003;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3530000, 3530001, 3530002) OR `Reference` IN (3530000, 3530001, 3530002);
DELETE FROM `creature_loot_template` WHERE `Entry` = 19514 AND `Item` = 1 AND `Reference` = 3530000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 19516 AND `Item` = 1 AND `Reference` = 3530001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 18805 AND `Item` = 1 AND `Reference` = 3530002;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3600000, 3600001, 3600002) OR `Reference` IN (3600000, 3600001, 3600002);
DELETE FROM `creature_loot_template` WHERE `Entry` = 18731 AND `Item` = 1 AND `Reference` = 3600000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 18667 AND `Item` = 1 AND `Reference` = 3600001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 18732 AND `Item` = 1 AND `Reference` = 3600002;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3610000, 3610002) OR `Reference` IN (3610000, 3610002);
DELETE FROM `creature_loot_template` WHERE `Entry` = 20636 AND `Item` = 1 AND `Reference` = 3610000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 20653 AND `Item` = 1 AND `Reference` = 3610002;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3620000, 3620001) OR `Reference` IN (3620000, 3620001);
DELETE FROM `creature_loot_template` WHERE `Entry` = 18472 AND `Item` = 1 AND `Reference` = 3620000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 18473 AND `Item` = 1 AND `Reference` = 3620001;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3630000) OR `Reference` IN (3630000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 20690 AND `Item` = 1 AND `Reference` = 3630000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3640001) OR `Reference` IN (3640001);
DELETE FROM `creature_loot_template` WHERE `Entry` = 18314 AND `Item` = 1 AND `Reference` = 3640001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 19306 AND `Item` = 1 AND `Reference` = 3640001;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3720000, 3720004, 3720005) OR `Reference` IN (3720000, 3720004, 3720005);
DELETE FROM `creature_loot_template` WHERE `Entry` = 23574 AND `Item` = 1 AND `Reference` = 3720000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 24239 AND `Item` = 1 AND `Reference` = 3720004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 23863 AND `Item` = 1 AND `Reference` = 3720005;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3740000, 3740003) OR `Reference` IN (3740000, 3740003);
DELETE FROM `creature_loot_template` WHERE `Entry` = 30748 AND `Item` = 1 AND `Reference` = 3740000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31673 AND `Item` = 1 AND `Reference` = 3740003;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3750000) OR `Reference` IN (3750000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 26687 AND `Item` = 1 AND `Reference` = 3750000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3760000, 3760003) OR `Reference` IN (3760000, 3760003);
DELETE FROM `creature_loot_template` WHERE `Entry` = 30774 AND `Item` = 1 AND `Reference` = 3760000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 30788 AND `Item` = 1 AND `Reference` = 3760003;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3780001, 3780004) OR `Reference` IN (3780001, 3780004);
DELETE FROM `creature_loot_template` WHERE `Entry` = 30510 AND `Item` = 1 AND `Reference` = 3780001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 30540 AND `Item` = 1 AND `Reference` = 3780004;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3790000) OR `Reference` IN (3790000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 27654 AND `Item` = 1 AND `Reference` = 3790000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3800000) OR `Reference` IN (3800000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 31558 AND `Item` = 1 AND `Reference` = 3800000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3840000) OR `Reference` IN (3840000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 26529 AND `Item` = 1 AND `Reference` = 3840000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3850000, 3850001, 3850004) OR `Reference` IN (3850000, 3850001, 3850004);
DELETE FROM `creature_loot_template` WHERE `Entry` = 31211 AND `Item` = 1 AND `Reference` = 3850000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31178 AND `Item` = 1 AND `Reference` = 3850001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31179 AND `Item` = 1 AND `Reference` = 3850001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31187 AND `Item` = 1 AND `Reference` = 3850001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31199 AND `Item` = 1 AND `Reference` = 3850001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31200 AND `Item` = 1 AND `Reference` = 3850001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31201 AND `Item` = 1 AND `Reference` = 3850001;
DELETE FROM `gameobject_loot_template` WHERE `Entry` = 24589 AND `Item` = 1 AND `Reference` = 3850004;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3860000) OR `Reference` IN (3860000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 27977 AND `Item` = 1 AND `Reference` = 3860000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3870000, 3870003) OR `Reference` IN (3870000, 3870003);
DELETE FROM `creature_loot_template` WHERE `Entry` = 31381 AND `Item` = 1 AND `Reference` = 3870000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31386 AND `Item` = 1 AND `Reference` = 3870003;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3890000, 3890001) OR `Reference` IN (3890000, 3890001);
DELETE FROM `creature_loot_template` WHERE `Entry` = 31362 AND `Item` = 1 AND `Reference` = 3890000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31336 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31337 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31338 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31339 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31340 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31342 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31343 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31345 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31347 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31351 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31352 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31354 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31355 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31357 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31359 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31360 AND `Item` = 1 AND `Reference` = 3890001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31363 AND `Item` = 1 AND `Reference` = 3890001;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3910000, 3910003) OR `Reference` IN (3910000, 3910003);
DELETE FROM `creature_loot_template` WHERE `Entry` = 31612 AND `Item` = 1 AND `Reference` = 3910000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31610 AND `Item` = 1 AND `Reference` = 3910003;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3920000) OR `Reference` IN (3920000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 28586 AND `Item` = 1 AND `Reference` = 3920000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3930000, 3930004) OR `Reference` IN (3930000, 3930004);
DELETE FROM `creature_loot_template` WHERE `Entry` = 31533 AND `Item` = 1 AND `Reference` = 3930000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31538 AND `Item` = 1 AND `Reference` = 3930004;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3940000, 3940006) OR `Reference` IN (3940000, 3940006);
DELETE FROM `creature_loot_template` WHERE `Entry` = 33113 AND `Item` = 1 AND `Reference` = 3940000;
DELETE FROM `gameobject_loot_template` WHERE `Entry` = 27086 AND `Item` = 1 AND `Reference` = 3940006;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3950000, 3950001, 3950003) OR `Reference` IN (3950000, 3950001, 3950003);
DELETE FROM `creature_loot_template` WHERE `Entry` = 34003 AND `Item` = 1 AND `Reference` = 3950000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 33190 AND `Item` = 1 AND `Reference` = 3950001;
DELETE FROM `creature_loot_template` WHERE `Entry` = 33885 AND `Item` = 1 AND `Reference` = 3950003;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3960002) OR `Reference` IN (3960002);
DELETE FROM `creature_loot_template` WHERE `Entry` = 29306 AND `Item` = 1 AND `Reference` = 3960002;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3970000, 3970003) OR `Reference` IN (3970000, 3970003);
DELETE FROM `creature_loot_template` WHERE `Entry` = 31370 AND `Item` = 1 AND `Reference` = 3970000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31368 AND `Item` = 1 AND `Reference` = 3970003;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (3990000, 3990003) OR `Reference` IN (3990000, 3990003);
DELETE FROM `creature_loot_template` WHERE `Entry` = 31507 AND `Item` = 1 AND `Reference` = 3990000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31506 AND `Item` = 1 AND `Reference` = 3990003;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4000000) OR `Reference` IN (4000000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 28860 AND `Item` = 1 AND `Reference` = 4000000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4010000) OR `Reference` IN (4010000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 31311 AND `Item` = 1 AND `Reference` = 4010000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4030000, 4030004) OR `Reference` IN (4030000, 4030004);
DELETE FROM `creature_loot_template` WHERE `Entry` = 31456 AND `Item` = 1 AND `Reference` = 4030000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 31464 AND `Item` = 1 AND `Reference` = 4030004;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4060000, 4060007) OR `Reference` IN (4060000, 4060007);
DELETE FROM `creature_loot_template` WHERE `Entry` = 36612 AND `Item` = 1 AND `Reference` = 4060000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 36597 AND `Item` = 1 AND `Reference` = 4060007;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4070005, 4070008) OR `Reference` IN (4070005, 4070008);
DELETE FROM `creature_loot_template` WHERE `Entry` = 38431 AND `Item` = 1 AND `Reference` = 4070005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 39166 AND `Item` = 1 AND `Reference` = 4070008;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4080000, 4080007) OR `Reference` IN (4080000, 4080007);
DELETE FROM `creature_loot_template` WHERE `Entry` = 37958 AND `Item` = 1 AND `Reference` = 4080000;
DELETE FROM `creature_loot_template` WHERE `Entry` = 39167 AND `Item` = 1 AND `Reference` = 4080007;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4090004, 4090007) OR `Reference` IN (4090004, 4090007);
DELETE FROM `creature_loot_template` WHERE `Entry` = 38586 AND `Item` = 1 AND `Reference` = 4090004;
DELETE FROM `creature_loot_template` WHERE `Entry` = 39168 AND `Item` = 1 AND `Reference` = 4090007;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4100000) OR `Reference` IN (4100000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 36497 AND `Item` = 1 AND `Reference` = 4100000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4110000) OR `Reference` IN (4110000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 36498 AND `Item` = 1 AND `Reference` = 4110000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4120000) OR `Reference` IN (4120000);
DELETE FROM `gameobject_loot_template` WHERE `Entry` = 27321 AND `Item` = 1 AND `Reference` = 4120000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4130000) OR `Reference` IN (4130000);
DELETE FROM `gameobject_loot_template` WHERE `Entry` = 27414 AND `Item` = 1 AND `Reference` = 4130000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4140000) OR `Reference` IN (4140000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 36494 AND `Item` = 1 AND `Reference` = 4140000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4150000) OR `Reference` IN (4150000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 37613 AND `Item` = 1 AND `Reference` = 4150000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4160000) OR `Reference` IN (4160000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 38113 AND `Item` = 1 AND `Reference` = 4160000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4170000) OR `Reference` IN (4170000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 38603 AND `Item` = 1 AND `Reference` = 4170000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4180000) OR `Reference` IN (4180000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 39863 AND `Item` = 1 AND `Reference` = 4180000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4190000) OR `Reference` IN (4190000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 39864 AND `Item` = 1 AND `Reference` = 4190000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4200000) OR `Reference` IN (4200000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 39944 AND `Item` = 1 AND `Reference` = 4200000;
COMMIT;

-- Removes only generated encounter pools and attachments.
START TRANSACTION;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (4210000) OR `Reference` IN (4210000);
DELETE FROM `creature_loot_template` WHERE `Entry` = 39945 AND `Item` = 1 AND `Reference` = 4210000;
COMMIT;

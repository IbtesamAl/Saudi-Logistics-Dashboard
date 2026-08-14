/*=========================================================
   DATA CLEANING - COUNTRY STANDARDIZATION
   Saudi Logistics Data Warehouse
=========================================================*/


/*=========================================================
  IMPORTS
=========================================================*/

UPDATE logistics.stg_imports SET country='إثيوبيا' WHERE country='اثيوبيا';
UPDATE logistics.stg_imports SET country='أوروجواي' WHERE country='أرجواي';
UPDATE logistics.stg_imports SET country='إريتريا' WHERE country='أريتريا';
UPDATE logistics.stg_imports SET country='إستونيا' WHERE country='استونيا';
UPDATE logistics.stg_imports SET country='الإكوادور' WHERE country='أكوادور';
UPDATE logistics.stg_imports SET country='الاتحاد الأوروبي' WHERE country='الإتحاد الأوربي';
UPDATE logistics.stg_imports SET country='السنغال' WHERE country='السنيغال';
UPDATE logistics.stg_imports SET country='الصين' WHERE country='الصين الشعبية';
UPDATE logistics.stg_imports SET country='ألمانيا' WHERE country='المانيا';
UPDATE logistics.stg_imports SET country='الولايات المتحدة' WHERE country='أمريكا';
UPDATE logistics.stg_imports SET country='أنتيقوا وباربودا' WHERE country='أنتيقوا و باربودا';
UPDATE logistics.stg_imports SET country='إندونيسيا' WHERE country='أندونيسيا';
UPDATE logistics.stg_imports SET country='أوغندا' WHERE country='اوغندا';
UPDATE logistics.stg_imports SET country='أوكرانيا' WHERE country='اوكرانيا';
UPDATE logistics.stg_imports SET country='بولندا' WHERE country='بولندا (بولونيا)';
UPDATE logistics.stg_imports SET country='بريتش إنديان أوشن' WHERE country='بريتش انديان اوشن';
UPDATE logistics.stg_imports SET country='جمهورية إفريقيا الوسطى' WHERE country IN ('ج إفريقيا الوسطى','جمهورية افريقيا وسطى','جمهوريةإفريقيا الوسطى');
UPDATE logistics.stg_imports SET country='ساحل العاج' WHERE country='ساحل العاج(كوتديفوار';
UPDATE logistics.stg_imports SET country='جزر فيرجين الأمريكية' WHERE country='جزر فيرجيني الأمريكي';
UPDATE logistics.stg_imports SET country='التشيك' WHERE country='جمهورية التشيك';
UPDATE logistics.stg_imports SET country='كامبوديا' WHERE country='كمبوديا';
UPDATE logistics.stg_imports SET country='المالديف' WHERE country='مالديف';
UPDATE logistics.stg_imports SET country='سنغافورة' WHERE country='سنغافوره';
UPDATE logistics.stg_imports SET country='الكونغو' WHERE country IN ('كونجو','كونغو');
UPDATE logistics.stg_imports SET country='ساموا الأمريكية' WHERE country='ساموا الأمريكيه';
UPDATE logistics.stg_imports SET country='بنغلادش' WHERE country='بنجلادش';


/*=========================================================
  EXPORTS
=========================================================*/

UPDATE logistics.stg_exports SET country='إثيوبيا' WHERE country='اثيوبيا';
UPDATE logistics.stg_exports SET country='أوروجواي' WHERE country='أرجواي';
UPDATE logistics.stg_exports SET country='إريتريا' WHERE country='أريتريا';
UPDATE logistics.stg_exports SET country='إستونيا' WHERE country='استونيا';
UPDATE logistics.stg_exports SET country='الإكوادور' WHERE country='أكوادور';
UPDATE logistics.stg_exports SET country='الاتحاد الأوروبي' WHERE country='الإتحاد الأوربي';
UPDATE logistics.stg_exports SET country='التشيك' WHERE country='جمهورية التشيك';
UPDATE logistics.stg_exports SET country='السنغال' WHERE country='السنيغال';
UPDATE logistics.stg_exports SET country='الصين' WHERE country='الصين الشعبية';
UPDATE logistics.stg_exports SET country='ألمانيا' WHERE country='المانيا';
UPDATE logistics.stg_exports SET country='الولايات المتحدة' WHERE country='أمريكا';
UPDATE logistics.stg_exports SET country='إندونيسيا' WHERE country='أندونيسيا';
UPDATE logistics.stg_exports SET country='أوغندا' WHERE country='اوغندا';
UPDATE logistics.stg_exports SET country='أوكرانيا' WHERE country='اوكرانيا';
UPDATE logistics.stg_exports SET country='بريتش إنديان أوشن' WHERE country='بريتش انديان اوشن';
UPDATE logistics.stg_exports SET country='بنغلادش' WHERE country='بنجلادش';
UPDATE logistics.stg_exports SET country='بولندا' WHERE country='بولندا (بولونيا)';
UPDATE logistics.stg_exports SET country='جمهورية إفريقيا الوسطى' WHERE country IN ('ج إفريقيا الوسطى','جمهورية افريقيا وسطى','جمهوريةإفريقيا الوسطى');
UPDATE logistics.stg_exports SET country='ساحل العاج' WHERE country='ساحل العاج(كوتديفوار';
UPDATE logistics.stg_exports SET country='كامبوديا' WHERE country='كمبوديا';
UPDATE logistics.stg_exports SET country='الكونغو' WHERE country IN ('كونجو','كونغو');
UPDATE logistics.stg_exports SET country='المالديف' WHERE country='مالديف';
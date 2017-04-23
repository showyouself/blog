dater=`date +%Y%m%d`
echo "start sync blog:${dater}========================"

#复制备份文件
cd ~/work/web
echo "mysqldump -uroot -p${sqlPD} wordpress" >  wordpress/blogdb.sql
exit;
cp blogbak.sh wordpress/
dater="${dater}.blog.zip"
zip -r ${dater} wordpress/
mv ${dater} tank/res 

#上传备份文件
cd tank/res
git add ${dater} 
git commit -m "bk ${dater}" 
git push ssh master 
echo "end sync blog ${dater}========================\n"

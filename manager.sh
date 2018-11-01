#! /bin/bash

custom_user(){
echo -e "Enter user name: "
read name
if grep -iE $name /etc/passwd ; 
then
echo "Wrong"
clear
fi
echo -e "Enter UID: "
read uid
echo -e "Enter GID: "
read gid
echo -e "Enter Expire date (YYYY-MM-DD): "
read expire
echo -e "Enter comment: "
read comment
groupadd -g $gid $name 
useradd $name -u $uid -g $gid -e $expire -c $comment
if grep $name /etc/passwd
then
echo "The user $name is already exist"
fi
}

default_user (){
echo -e "Enter user name: "
read name
useradd $name
}

mod_user() 
{
clear
echo -e "User MODIFICATION"
echo -e "1)NAME\n"
echo -e "2)UID\n"
echo -e "3)GID\n"
echo -e "4)Expire date\n"
echo -e "5)Comment\n"
read x
case $x in
1)
echo "Enter user name:"
read user_name
echo "Enter new name: "
read new_name
if grep $new_name /etc/passwd;
then
clear
echo "This name is already exist\n"
read w
else 
usermod -l $new_name $user_name
echo "Name changed"
read w
fi 
;;
2)
echo "Enter user name:"
read user_name
echo "Enter new UID: "
read new_uid
if grep $new_uid /etc/passwd;
then
clear
echo "This uid is already exist\n"
read w
else 
usermod -u $new_uid $user_name
echo "UID changed"
read w
fi 
;;
3)
echo "Enter user name:"
read user_name
echo "Enter new GID: "
read new_gid
if grep $new_gid /etc/passwd;
then
clear
echo "This gid is already exist\n"
read w
else 
usermod -g $new_gid $user_name
echo "GID changed"
read w
fi 
;;
4)
echo "Enter user name:"
read user_name
echo "Enter new EXP Date: "
read new_date
if grep $new_date /etc/passwd;
then
clear
read w
else 
usermod -e $new_date $user_name
echo "EXP Date changed"
read w
fi 
;;
5)
echo "Enter user name:"
read user_name
echo "Enter new comment: "
read new_com
if grep $new_com /etc/passwd;
then
clear
read w
else 
usermod -c $new_com $user_name
echo "Comment changed"
read w
fi 
;;
esac
}

create_user(){
while true
do
clear
echo -e "Create User"
echo -e "1)Custom"
echo -e "2)Defaults"
echo -e "3)Back"
read create_user
case $create_user in
1)custom_user
;;
2)default_user 
;;
3)user
;;
esac
done
}

custom_group(){
clear
echo -e "Create custom group\n"
echo -e "Enter group name:"
read group_name
echo -e "Enter group ID: "
read group_id
if grep $group_name /etc/group && grep $group_id /etc/group;
then 
echo -e "Error\n"
sleep 3
else
groupadd -g $group_name $group_id
fi 
}

def_group(){
clear
echo -e "Create default group\n"
echo -e "Enter group name:"
read group_name
if grep $group_name /etc/group;
then 
echo -e "Error\n"
sleep 3
else
groupadd $group_name 
fi 
}

create_group(){
while true
do
clear
echo -e "Create Group"
echo -e "1)Custom"
echo -e "2)Defaults"
echo -e "3)Back"
read create_group
case $create_group in
1)custom_group
;;
2)def_group
;;
3)group
;;
esac
done
}

delete_user(){
echo "Enter user name:"
read user_name
userdel $user_name
echo "User deleted"
read w
}

user (){
while true 
do
clear
echo -e "Users menu\n"
echo -e "1)Create user\n"
echo -e "2)Modificate user\n"
echo -e "3)Delete user\n"
echo -e "4)Back\n"
read user
case $user in
1)create_user
;;
2)mod_user
;;
3)delete_user
;;
4)main
;;
esac 
done
}

group(){
while true 
do
clear
echo -e "GROUPS MENU\n"
echo -e "1)Create group\n"
echo -e "2)Modificate group\n"
echo -e "3)Delete group\n"
echo -e "4)Back\n"
read group
case $group in
1)create_group
;;
2)
;;
3)
;;
4)main
;;
esac
done
}

#show_user (){
#echo -e " "
#}

main(){
while true
do 
clear
echo -e "MENU\n"
echo -e "1)Users\n"
echo -e "2)Groups\n"
echo -e "3)Show User\n"
echo -e "4)Show Group\n"
echo -e "5)Exit program\n" 
read menu
case $menu in
1)user
;;
2)group
;;
3)show_user
;;
4)show_group
;;
5)
exit 0
;;
esac
done
}
main

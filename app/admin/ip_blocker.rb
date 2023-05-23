ActiveAdmin.register BxBlockIpBlocker::IpBlocker, as: "Ip_Blocker" do
    menu label: "Ip Blocker"
      permit_params :ip_address, :valid_ip
      index do
        selectable_column
        id_column
        column :ip_address
        column :valid_ip
        actions
      end
  
      filter :ip_address
      filter :created_at
  
      form do |f|
        f.inputs do
          f.input :ip_address
          f.input :valid_ip
         
        end
        f.actions
      end
    end
  
<#-- @formatter:off -->
package ${package}.commands;

import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Entity;
import org.bukkit.World;
import org.bukkit.command.BlockCommandSender;

import ${package}.procedures.*;

public class ${name} implements CommandExecutor {

	@Override
	public boolean onCommand(CommandSender sender, Command cmd, String label, String[] args) {
		if(label.equalsIgnoreCase("${data.commandName}") && sender.hasPermission("${data.commandName}.use")) {
			double x = 0;
			double y = 0;
			double z = 0;

			Entity entity = null;
			World world = null;

			if (sender instanceof Entity) {
				entity = (Entity) sender;
				x = entity.getLocation().getX();
				y = entity.getLocation().getY();
				z = entity.getLocation().getZ();
				world = entity.getWorld();
			} else if (sender instanceof BlockCommandSender) {
				x = ((BlockCommandSender) sender).getBlock().getLocation().getX();
				y = ((BlockCommandSender) sender).getBlock().getLocation().getY();
				z = ((BlockCommandSender) sender).getBlock().getLocation().getZ();
				world = ((BlockCommandSender) sender).getBlock().getWorld();
			}

			<#list procedures as procedure>
			${procedure.getModElement().getName()}Procedure.execute();
			</#list>

			return true;
		}
		return false;
	}
}
<#-- @formatter:on -->